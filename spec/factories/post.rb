FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraphs(2)
    excerpt Faker::Lorem.paragraph
  end
end
