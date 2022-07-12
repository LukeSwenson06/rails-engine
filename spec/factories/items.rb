FactoryBot.define do
  factory :item do
    name {Faker::Games::HeroesOfTheStorm.battleground} #string
    description {Faker::Games::HeroesOfTheStorm.quote} #string
    unit_price {Faker::Number.decimal(l_digits: 2)} #float
    merchant
  end
end
