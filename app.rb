require 'sinatra/base'
require 'sinatra/flash'
require './lib/space.rb'
require_relative 'environment_selection.rb'
require './lib/user.rb'
require 'uri'

class App < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  post '/spaces' do
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      userid: session[:user_id],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    redirect ('/spaces')
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect ('/users')
  end

  get '/users' do
    @user = User.find(id: session[:user_id])
    erb :'/users/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect ('/sessions')
    else
      flash[:notice] = 'Please check your email or password'
      redirect ('/sessions/new')
    end
  end

  get '/sessions' do
    @user = User.find(id: session[:user_id])
    erb :'sessions/index'
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out'
    redirect ('/sessions/new')
  end

  get '/sessions/destroy' do
    erb :'sessions/destroy'
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id])
    erb :'spaces/:id'
  end

  get '/users/:id' do
    flash[:notice] = 'Congratulations! You have booked your trip'
    redirect ('/spaces')
  end

  run! if app_file==$0

end
