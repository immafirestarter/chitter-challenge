ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, ''

get '/' do
    erb(:index)
  end

get '/signup' do
  erb(:signup)
end

post '/register_user' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_email] = @user.email
    redirect '/home'
  end

get '/home' do
erb(:home)
end
end
