class Api::V1::DonationsController < ApplicationController
  def show
    render json: Donation.find(params[:donation_id])
  end

  def index
    render json: Donation.where(user_id: params[:user_id])
  end

  def create
    donation = Donation.create!(user_id: safe_params[:user_id],
                     pickup_date: safe_params[:pickup_date],
                     pickup_address: safe_params[:pickup_address])
    DonationItem.create_association(donation.id, safe_params[:items])
    render json: donation
  end

  private

  def safe_params
    params.permit(:user_id, :email, :pickup_date, :pickup_address, items: [:name, :quantity, :id])
  end
end
