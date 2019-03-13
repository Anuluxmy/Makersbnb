require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/booking'
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
  @spaces = Space.all
  erb :'spaces/list'
end

get '/spaces/create' do

  erb :'spaces/create_space'
end

post '/spaces/create' do
  @from_day = params[:from_day]
  @from_month = params[:from_month]
  @from_date = Date.new(2019,@from_month.to_i,@from_day.to_i)
  @to_day = params[:to_day]
  @to_month = params[:to_month]
  @to_date = Date.new(2019,@to_month.to_i,@to_day.to_i)
  Space.create(:name=>params[:space_name], :description=>params[:description], :price_per_night=>params[:price_per_night].to_i, :available_from=>@from_date, :available_to=>@to_date, :user_id => session[:id])
  redirect '/spaces'
end

get '/bookings' do
  # guest
  # database get all bookings for session user id
  #Booking.all(:user_id => session[:id])
  #erb : bookings
end

get '/bookings/create' do
  # guest
  # database get space where spaceid = params space id
  #Space.get(:id=>params[:space_id])
  #erb : bookings_create
end

post '/bookings/create' do
  # guest
  #database create booking
  #Booking.create(:date=>params[?????],:status=>:new, :user_id=>session[:id], :space_id=>params[????])
  #redirect '/bookings'
end

get '/approvals' do
   # owner
   # database get all bookings where space userid = session id
   #Booking.all(:space_id.user_id=>session[:id])
  #erb : approvals
end

post '/approvals/update' do
  # owner
  #database update booking
  #booking = Booking.get(:id=>params[:booking_id])
  #booking.update(:status=>params[:status])
  #redirect '/approvals'
end

run! if app_file == $0
end
