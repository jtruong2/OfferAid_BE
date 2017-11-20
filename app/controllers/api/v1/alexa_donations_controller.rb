class Api::V1::AlexaDonationsController < ApplicationController
  def create
    byebug
  end

  private

  def safe_params
    params.permit(:items, :pickup_date, :pickup_address)
  end
end
