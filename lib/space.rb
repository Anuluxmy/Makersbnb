require 'data_mapper'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price_per_night, Integer
  property :available_from, Date
  property :available_to, Date

  belongs_to :user
  has n, :bookings

end
