# Sinatra in the modular style
ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManger < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/links' do
    # .all is a DataMapper method which fetches all the data from
    # the database that belong to the "Link" class
    current_user
    @links = Link.all
    erb(:'links/index')
  end


  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title].capitalize)
      params[:tags].split(', ').each do |tag|
      new_tag = Tag.first_or_create(name: tag)
      link.tags << new_tag
      end
    link.save
    redirect to('/links')
  end

  post '/tag' do
    redirect "/tags/#{params[:search]}"
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    erb(:'signup')
  end

  post '/users/new' do
    user = User.create(email_address: params[:email_address], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
  end

  run! if app_file == $0
end
