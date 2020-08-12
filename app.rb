require 'sinatra/base'
require './lib/space.rb'
require_relative 'environment_selection.rb'
require './lib/user.rb'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect ('/spaces')
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect ('/users')
  end

  get '/users' do
    erb :'/users/index'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    # set up sessions here (.find, .authenticate user method)
    redirect('/sessions')
  end

  get '/sessions' do
    erb :'sessions/index'
  end


  run! if app_file==$0

end
