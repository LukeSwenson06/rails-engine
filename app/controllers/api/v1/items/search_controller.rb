class Api::V1::Items::SearchController < ApplicationController
  def index
    search = Item.search_all_items(params[:name])
    if search.present?
      render json: ItemSerializer.new(search)
    else
      render json: {data: []}, status: 400
    end
  end
end
