require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'

require 'sinatra/reloader'
require 'byebug'

require './models'

set :database, {adapter: "sqlite3", database: "db/database.db"}
#set :sessions, true
#enable :sessions

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  register Sinatra::Flash

def current_user
  if session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end

get '/' do
  haml :home
end

get '/users' do
  @users = User.all
  haml :users
end

get '/users/create' do
  User.create(email: "Hadrian@gmail.com", first_name: "Hadrian", last_name: "Zhang")
  haml :create
end

get '/users/last' do
  @user = User.last
  haml :user
end

get '/users/:id' do
  @user = User.find(params[:id])
  haml :user
end

get '/login' do
  haml :login
end

get 'sessions/new' do
  haml :login
end

post '/sessions/create' do
  puts params.inspect
  if @user= User.where(username: params[:username], password: params[:password]).first
    puts "User LogIn"
    session[:user_id] = @user.id
   # haml :login_success
    flash[:btn] = "you've succesfully logged in"
    redirect '/'

  else
    @error = 'Login Failed'
    puts "Login Error"
    haml :login
  end

#byebug
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


get '/register' do
  haml :register
end

post '/register' do
  puts params.inspect
  User.create(email: params[:email], username: params[:username], password: params[:password], first_name: params[:first_name], last_name: params[:last_name])
  # flash[:notice] = "you've sucessfully registered!"
  redirect '/login'
end

run! if __FILE__ == $0
end
