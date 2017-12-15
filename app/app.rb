# Sinatra in the modular style
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManger < Sinatra::Base

  enable :sessions
  set :session_secret, 'keep it secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/links' do
    # .all is a DataMapper method which fetches all the data from
    # the database that belong to the "Link" class
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/tag' do
    redirect "/tags/#{params[:search]}"
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
