FactoryBot.define do
  factory :transaction do
    credit_card_number {Faker::Number.number(digits: 6)} #string
    credit_card_expiration_date {Faker::Date.forward(days: 1)} #string
    result {["success", "failure"]} #string
  end
end
