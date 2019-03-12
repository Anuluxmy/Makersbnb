require 'data_mapper'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :date, Date
  property :status, Enum[ :new, :approved, :confirm ]

  belongs_to :user
  belongs_to :space

end
