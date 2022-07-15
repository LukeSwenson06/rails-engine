require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many :invoice_items }
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_numericality_of :unit_price }
  end

  it "can use cap insenstive to find all items" do
    merchant = create(:merchant)
    item1 = create(:item, name: "The Shadows Ring", merchant: merchant)
    item2 = create(:item, name: "ring a ding", merchant: merchant)
    item3 = create(:item, name: "Bracers", merchant: merchant)
    item4 = create(:item, name: "Anklet", merchant: merchant)

    expect(Item.search_all_items("rInG")).to eq([item1, item2])
  end

  describe "destroy" do
    it "can destroy the invoice if item is destroyed" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id)

    expect(Invoice.all).to eq([invoice])

    item.destroy

    expect(Invoice.all).to eq([])
    end
  end
end
