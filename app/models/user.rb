class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip_code, :email, :password
end
