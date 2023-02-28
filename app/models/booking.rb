class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :eventspaces

  enum :status, { pending: 0, accepted: 1, declined: 2 },  default: :pending # when a booking is created, default value is pending
  # allows us to do Booking.pending and all Bookings with pending status
  # allows to store booking in a variable, and do "Booking.accepted" to actually mark Booking accepted.

  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
