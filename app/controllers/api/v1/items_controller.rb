class Api::V1::ItemsController < ApplicationController
  def index
    donation = Donation.find(params[:donation_id])
    render json: donation.items
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
