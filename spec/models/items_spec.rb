require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_numericality_of :unit_price }
  end

  # it "can use cap insenstive to find all items" do
  #   merchant = create(:merchant)
  #   item1 = create(:item, name: "Cheeseburger", merchant: merchant)
  #   item2 = create(:item, name: "Chess Set", merchant: merchant)
  #   item3 = create(:item, name: "Hamburger", merchant: merchant)
  #   item4 = create(:item, name: "checkers set", merchant: merchant)
  #
  #   expect(Item.search_item("cHes")).to eq([item1, item2])
  # end
end
