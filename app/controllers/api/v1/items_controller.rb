class Api::V1::ItemsController < ApplicationController
  def index
    donation = DonationItem.find(params[:donation_id])
    itemsID =  donation.donation_items, include: ['item']

  end

  def show
    user = User.find(params[:user_id])
    count = DonationItem.get_count(user)
    render json: {count: count}
  end

  private

  def safe_params
    params.require(:item).permit(:name, :quantity)
  end
end
