# Sinatra in the modular style
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManger < Sinatra::Base

  get '/' do
    'Hello world!'
  end

  get '/links' do
    # .all is a DataMapper method which fetches all the data from
    # the database that belong to the "Link" class
    @links = Link.all
    erb :'links/index'
  end
  run! if app_file == $0
end
