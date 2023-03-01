class Eventspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  
  # this is to make sure that when a user books an event space, the event spaces are now connected to the user.
  has_many :users, through: :bookings

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
