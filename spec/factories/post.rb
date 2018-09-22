FactoryBot.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraphs(2)
    excerpt Faker::Lorem.paragraph
    published_at { Time.zone.now - 1.day}
    email false

    trait :with_image do
      header_image File.new(Rails.root.join('spec/fixtures/test.jpg'))
    end
  end
end
