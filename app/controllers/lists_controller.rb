require 'pry'

class ListsController < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :index
  end

  get '/list/new' do
    @show = Show.all
    erb :'/list/new'
  end

  post '/list/new' do
    @list = List.create(params[:title])
    @list.shows << Show.create(name: params["show"]["name"], overview: params["show"]["overview"])
    redirect "list/#{@list.id}"
  end

  get "list/#{@list.id}" do
    @list.find_by(params[:id])
    erb :show
  end

end
