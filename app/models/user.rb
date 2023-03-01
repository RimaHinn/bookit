class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :eventspaces
  has_many :bookings
  # this is to make sure that when a user books an event space, the event spaces are now connected to the user. 
  has_many :eventspaces, through: :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
