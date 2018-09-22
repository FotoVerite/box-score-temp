# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  school_id              :integer
#  sub_editor             :boolean          default(FALSE)
#

require 'rails_helper'

describe Admin do
  it { should belong_to :school }

  describe '#name' do
    subject(:admin) { create :admin, first_name: 'Bob', last_name: 'Loblaw' }

    it 'concatinates the first and last names' do
      admin.name.should == 'Bob Loblaw'
    end
  end
end
