class ListsController < ApplicationController

  get 'new_list' do
    #@shows = Show.all
    erb :new_list
  end

end
