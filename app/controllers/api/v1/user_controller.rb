class Api::V1::UserController < ApplicationController
  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(safe_params)
    if user.save
      render json: user
    else
      render file: 'public/500.html'
    end
  end

  def update
    user = User.find(params[:id])
    user.update_attributes!(safe_params)
  end

  private

  def safe_params
    params.require(:user).permit(:first_name, :last_name, :street_address, :city, :state, :zip_code, :email, :password)
  end
end
