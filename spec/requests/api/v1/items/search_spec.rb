require 'rails_helper'

RSpec.describe 'Item Search' do
  it "can find all items with the search paramaters" do
    merchant = create(:merchant)
    item1 = create(:item, name: "The Shadows Ring", merchant: merchant)
    item2 = create(:item, name: "ring a ding", merchant: merchant)
    item3 = create(:item, name: "Bracers", merchant: merchant)
    item4 = create(:item, name: "Anklet", merchant: merchant)

    get '/api/v1/items/find_all?name=rInG'

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    items = response_body[:data].map do |item|
      item[:attributes][:name]
    end

    expect(items).to eq([item1.name, item2.name])
    expect(items).to_not eq([item3.name, item4.name])

  end
end
