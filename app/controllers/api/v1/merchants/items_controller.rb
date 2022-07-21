class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end

  def show
    render json: ItemsSoldSerializer.new(Merchant.most_items(params[:quantity]))
  end
end
