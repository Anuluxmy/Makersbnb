require 'data_mapper'

  def clear_test
    Booking.destroy
    Space.destroy
    User.destroy
 end