require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :user_name,      String, :unique_index => true    # A varchar type string, for short strings
  property :email,    String    # A varchar type string, for short strings
  property :password, BCryptHash  # An encrypted password....
  
  has n, :spaces
  end
