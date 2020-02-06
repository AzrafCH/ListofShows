class ListsController < ApplicationController

  post '/new_list' do
    #@shows = Show.all
    @list = List.create(params[:title])
    @list.shows << Show.create(name: params["show"]["name"], overview: params["show"]["overview"])
    redirect '/#{@list.id}'
  end

  get '/:id' do
    @list = List.find(params[:id])
    erb :list_show
  end

end
