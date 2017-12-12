# Sinatra in the modular style
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/link'

class BookmarkManger < Sinatra::Base

  get '/links' do
    # .all is a DataMapper method which fetches all the data from
    # the database that belong to the "Link" class
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  run! if app_file == $0
end
