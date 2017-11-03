class Api::V1::AllItemsController < ApplicationController
  def index
    render json: Item.sorted_items
  end
end
