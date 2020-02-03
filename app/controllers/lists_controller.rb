class ListsController < ApplicationController

  get '/lists' do
    @list = List.all
    erb :lists_index
  end

  post '/new_list' do

    erb :new_list
  end

end
