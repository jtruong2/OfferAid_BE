class Api::V1::ItemsController < ApplicationController
  def index
    donation = Donation.find(params[:donation_id])
    render json: donation.items
  end

  private

  def safe_params
    params.require(:item).permit(:name, :quantity)
  end
end
