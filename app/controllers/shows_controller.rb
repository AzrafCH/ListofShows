class ShowsController < ApplicationController

  post '/shows' do
    name = params["name"]
    @shows = Show.search_shows_by_name(name)
    #@shows_parsed = Show.order_shows(shows)
    erb :index
  end

end
