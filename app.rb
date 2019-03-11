require 'sinatra/base'

class Makersbnb < Sinatra::Base

get '/' do
  "Welcome to Makersbnb!"
end

run! if app_file == $0
end
