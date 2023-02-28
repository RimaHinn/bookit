class Eventspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
