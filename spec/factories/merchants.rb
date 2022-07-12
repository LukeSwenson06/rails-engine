FactoryBot.define do
  factory :merchant do
    name { Faker::Games::WorldOfWarcraft.hero  }
  end
end
