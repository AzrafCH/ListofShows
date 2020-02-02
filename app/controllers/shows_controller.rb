class ShowsController < ApplicationController

  post '/shows' do
    name = params["name"]
    @shows = Show.search_shows_by_name(name)

    erb :index
  end

end
