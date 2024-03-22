class User < ApplicationRecord
  belongs_to :location

  validates :name, :email, :address, :phone_number, presence: true
end
