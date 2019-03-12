require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/space'
require 'data_mapper'

class Makersbnb < Sinatra::Base

  enable :sessions

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
  if !session[:id].nil?
    @user = User.get(session[:id])
  end
  erb :'index'
end

get '/accounts/new' do
  erb :'users/signup'
end

post '/accounts' do
  User.create(:user_name=>params[:user_name], :email=>params[:email], :password=>params[:password])
  @user = User.last(:user_name=>params[:user_name], :email=>params[:email], :password=>params[:password])
  session[:id] = @user.id
  redirect '/'
end

post '/accounts/sign_in' do
  @user = User.last(:user_name=>params[:user_name], :password=>params[:password])
  if !@user.nil?
    session[:id] = @user.id
  else
    # flash message of error
  end
  redirect '/'
end

post '/accounts/logout' do
  session.clear
  redirect '/'
end

get '/spaces' do
  #get all spaces from database
  erb :'spaces/list'
end

get '/spaces/create' do
  erb :'spaces/create_space'
end

post '/spaces/create' do
  #create space in database
  redirect '/spaces'
end

run! if app_file == $0
end
