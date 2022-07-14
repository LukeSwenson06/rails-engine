require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

    it "can use cap insenstive searchs for 1 merchant and returns the first one in alphabetical order" do
      merchant1 = create(:merchant, name: "Alpinaud Leveilleur")
      merchant2 = create(:merchant, name: "Almeric de Borel")
      merchant3 = create(:merchant, name: "Thancred Waters")
      merchant4 = create(:merchant, name: "Y'shtola Rhul")

      expect(Merchant.search_merchant("aLpI")).to eq([merchant1])
      expect(Merchant.search_merchant("al")).to eq([merchant2])

  end
end
