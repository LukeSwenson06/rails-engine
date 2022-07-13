require 'rails_helper'

RSpec.describe 'Items API' do
  it "sends a list of items" do
    create_list(:item, 5)

    get '/api/v1/items'

    response_body = JSON.parse(response.body, symbolize_names: true)
    items = response_body[:data]

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    expect(items).not_to be_empty

    expect(items.count).to eq(5)

    items.each do |item|
      expect(item).to have_key(:id)
      expect(item[:id]).to be_an(String)

      expect(item).to have_key(:attributes)
      expect(item[:attributes][:name]).to be_a(String)
      expect(item[:attributes][:description]).to be_a(String)
      expect(item[:attributes][:unit_price]).to be_a(Float)

      expect(item[:attributes]).to_not have_key(:created_at)
      expect(item[:attributes]).to_not have_key(:updated_at)

    end
  end

  it "sends a list of 1 item" do
    items = create_list(:item, 5)
    item1 = items.first
    item2 = items.second

    get "/api/v1/items/#{item1.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    item = response_body[:data]

    expect(response).to have_http_status(200)

    expect(item).to have_key(:attributes)
    expect(item[:attributes][:name]).to be_a(String)
    expect(item[:attributes][:description]).to be_a(String)
    expect(item[:attributes][:unit_price]).to be_a(Float)

    expect(item[:attributes]).to_not have_key(:created_at)
    expect(item[:attributes]).to_not have_key(:updated_at)

  end

  it "can create a new item" do
    merchant = create(:merchant)
    item_params = ({
      name: "Magic Wand",
      description: "Its only the most magical thing in the world",
      unit_price: 1.00,
      merchant_id: merchant.id
      })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    created_item = Item.last

    expect(response).to have_http_status(201)
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])

  end

  it "can delete a item" do
    items = create_list(:item, 5)
    item1 = items.first
    expect(items.count).to eq(5)

    delete "/api/v1/items/#{item1.id}"
    item = Item.all
    expect(response).to have_http_status(204)
    expect(item.count).to eq(4)

  end

  it "can update an existing item" do
    merchant = create(:merchant)
    id = create(:item).id
    previous_name = Item.last.name
    item_params = ({
      name: "Magic Wand2",
      description: "Its only the 2nd most magical thing in the world",
      unit_price: 2.00,
      merchant_id: merchant.id
      })
    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate({item: item_params})
    item = Item.find_by(id: id)

    expect(response).to have_http_status(200)
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Magic Wand2")

  end
end
