require 'sinatra/base'
require './lib/space.rb'
require_relative 'environment_selection.rb'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect ('/spaces')
  end

  get '/spaces/add' do
    erb :'spaces/add'
  end

  run! if app_file==$0

end
