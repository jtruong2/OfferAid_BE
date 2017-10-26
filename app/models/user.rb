class User < ApplicationRecord
  has_secure_password
  has_many :donations

  validates_presence_of :first_name, :last_name, :street_address, :city, :state, :zip_code, :email
end
