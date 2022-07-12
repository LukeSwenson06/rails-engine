FactoryBot.define do
  factory :customer do
    first_name {Faker::Name.first_name } #string
    last_name {Faker::Name.last_name } #string
  end
end
