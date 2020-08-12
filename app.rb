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

  get '/spaces/add' do
    erb :'spaces/add'
  end

  get '/users/add' do
    erb :'/users/add'
  end

  post '/users' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    redirect ('/users')
  end

  get '/users' do
    erb :'/users/index'
  end

  run! if app_file==$0

end
