require 'sinatra/base'
require_relative './lib/user'
require 'data_mapper'

class Makersbnb < Sinatra::Base

  if ENV['RACK_ENV'] == 'test'
    DataMapper.setup(:default, 'postgres://user@127.0.0.1:5432/makersbnb_test')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  else
    DataMapper.setup(:default, 'postgres://user@127.0.0.1:5432/makersbnb')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

get '/' do
  erb :'index'
end

get '/accounts/new' do
  erb :'users/signup'
end

post '/accounts' do
  User.create(:user_name=>params[:user_name], :email=>params[:email], :password=>params[:password])
  redirect '/'
end

run! if app_file == $0
end
