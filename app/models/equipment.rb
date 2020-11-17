class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :description, :category, :location, :price, presence: true
end
