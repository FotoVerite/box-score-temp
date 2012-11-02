desc "One-off task to import csv of teams/admins"
task :import_csv => :environment do
  require 'csv'

  class ModificationError < Exception
  end

  # we want to know if the csv later contradicts itself so we'll mark fields
  # as preserved and then raise errors if you try to set them from a non-blank
  # value to a new value
  module Unmodifiable
    def preserve *attributes
      attributes.each do |attr|
        define_method("#{attr}=") do |new_value|
          current_value = self.send(attr)

          if current_value.present? && current_value != new_value && new_value.present?
            raise ModificationError.new("tried to modify #{attr} from #{current_value} to #{new_value} for #{self.inspect}")
          end

          # actually set the value
          self[attr] = new_value
        end
      end
    end
  end

  School.send(:extend, Unmodifiable)
  School.send(:preserve, :assn_id, :athletic_director_email, :athletic_director_name)

  League.send(:extend, Unmodifiable)
  League.send(:preserve, :assn_id)

  Team.send(:extend, Unmodifiable)
  Team.send(:preserve, :coach_name, :coach_phone, :coach_email, :competitive_class)

  def ensure_admin_exists(row, school, email, name)
    email.downcase!

    admin = school.admins(true).find_by_email(email) || school.admins.build(email: email)

    begin
      if admin.new_record?
        admin.first_name, admin.last_name = (name || '').split(' ', 2)
        admin.password = SecureRandom.hex(32)
        admin.save!
      end
    rescue => ex
      puts "could not create admin #{email} because #{ex} for #{row.inspect}"
    end
  end


  # all or nothing...
  School.transaction do
    expected_headers = [:school, :association, :league__division, :class, :address_line_1, :address_line_2, :athletic_director, :phone_number, :ath_dir_email_address, :basketball_coach, :coach_phone_number, :coach_email_address]

    Sport.all.map(&:id).each do |sport_id|
      file_name = "#{Rails.root}/db/#{sport_id}.csv"

      unless File.exist?(file_name)
        puts "couldn't find an import file named #{file_name}"
        next
      end

      rows = CSV.read(file_name, {:headers => true, :header_converters => :symbol})

      actual_headers = rows.first.headers
      raise "unexpected headers #{expected_headers - actual_headers}" unless expected_headers == actual_headers

      season = Season.find_or_initialize_by_year_and_sport_id('2012-2013', sport_id)
      season.start_date ||= Date.today
      season.current = true
      season.save!

      rows.each do |row|
        next if row[:school].nil?

        begin
          association = Assn.find_or_create_by_name(row[:association])

          school = School.find_or_initialize_by_name(row[:school])
          school.assn_id = association.id
          school.address_1 = row[:address_line_1]
          school.address_2 = row[:address_line_2]
          school.athletic_director_name = row[:athletic_director]
          school.athletic_director_phone = row[:phone_number]
          school.athletic_director_email = row[:ath_dir_email_address]
          school.save!

          league = League.find_or_initialize_by_name(row[:league__division])
          league.assn_id = association.id
          league.classification = row[:class]
          league.save!

          team = Team.find_or_initialize_by_school_id_and_sport_id(school.id, sport_id)
          team.coach_name = row[:basketball_coach]
          team.coach_phone = row[:coach_phone_number]
          team.coach_email = row[:coach_email_address]
          team.competitive_class = row[:class]
          team.league = league
          team.season = season
          team.save!

          if row[:ath_dir_email_address].present?
            ensure_admin_exists(row, school, row[:ath_dir_email_address], row[:athletic_director])
          end

          if row[:coach_email_address].present?
            ensure_admin_exists(row, school, row[:coach_email_address], row[:basketball_coach])
          end

        rescue ModificationError => ex
          puts "At row"
          p row
          puts "Encountered error: #{ex}"
        end
      end
    end
  end
end
