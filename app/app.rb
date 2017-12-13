# Sinatra in the modular style
ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative '../app/models/data_mapper_setup'

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
    link = Link.new(url: params[:url], title: params[:title])
    # first_or_create will create a new tag if it doesn't already exsits
    tag = Tag.first_or_create(name: params[:tags])
    link.tags.push(tag)
    p link
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
