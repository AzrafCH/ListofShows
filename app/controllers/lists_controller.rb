require 'pry'

class ListsController < ApplicationController

  get '/lists' do
    @lists = List.all
    erb :'/list/index'
  end


  post '/list/new' do
    @list = List.create(params[:title])
    @list_shows = params[:show_id]
    redirect "list/#{@list.id}"

    erb :'/list/new'
  end

  #get "list/#{@list.id}" do
#    @list.find_by(params[:id])
#    erb :show
#  end

end
