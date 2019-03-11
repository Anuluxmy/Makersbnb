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
  @user = User.all(:id=> session[:id])
  erb :'index'
end

get '/accounts/new' do
  erb :'users/signup'
end

post '/accounts' do
  User.create(:user_name=>params[:user_name], :email=>params[:email], :password=>params[:password])
  @user = User.all(:user_name=>params[:user_name], :email=>params[:email], :password=>params[:password]))
  session[:id] = user.id
  redirect '/'
end

post '/accounts/sign_in' do

  #  check details
  # log-in suer
  redirect '/'
end

run! if app_file == $0
end
