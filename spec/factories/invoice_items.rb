FactoryBot.define do
  factory :invoice_item do
    quantity {Faker::Number.number(digits: 2)} #integer
    unit_price {Faker::Number.decimal(l_digits: 2)}#float
  end
end
