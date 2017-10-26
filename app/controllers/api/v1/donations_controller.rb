class Api::V1::DonationsController < ApplicationController
  def show
    render json: Donation.find(params[:donation_id])
  end

  def index
    render json: Donation.where(user_id: params[:user_id])
  end
end
