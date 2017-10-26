class Api::V1::ItemsController < ApplicationController
  def index
    donation = Donation.find(params[:donation_id])
    render json: donation.items
  end

  def create
    item = Item.find_or_create(safe_params)
    donation = Donation.find(params[:donation_id])
    DonationItem.create!(item_id: item.id, donation_id: donation.id, quantity: safe_params["quantity"])
  end

  private

  def safe_params
    params.require(:item).permit(:name, :quantity)
  end
end
