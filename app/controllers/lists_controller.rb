class ListsController < ApplicationController

  get '/lists' do
    @list = List.all
    erb :lists_index
  end

  get '/new_list' do
    @show = Show.all
    erb :lists_new
  end

end
