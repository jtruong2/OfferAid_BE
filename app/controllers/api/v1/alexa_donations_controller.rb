class Api::V1::AlexaDonationsController < ApplicationController
  def create
    items = Item.convert_from_voice(safe_params[:items])
    donation = Donation.create!(
      user_id: safe_params[:user_id],
      pickup_date: safe_params[:pickup_date],
      pickup_address: safe_params[:pickup_address]
    )
    DonationItem.create_association(donation.id, items)
    render json: donation
  end

  private

  def safe_params
    params.permit(:items, :pickup_date, :pickup_address, :user_id)
  end
end
