require 'sinatra/base'

class Makersbnb < Sinatra::Base

  if ENV['RACK_ENV'] == 'test'
    DataMapper.setup(:default, 'postgres://postgres@127.0.0.1:5432/chitter_test')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  else
    DataMapper.setup(:default, 'postgres://postgres@127.0.0.1:5432/chitter_prod')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

get '/' do
  'Welcome to Makers BnB'
end

get '/signup' do
  # erb :FIND OUT NAME FROM OTHER TEAM
end

run! if app_file == $0
end
