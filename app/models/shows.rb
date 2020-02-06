require 'json'
require 'net/http'
require 'pry'

class Show < ActiveRecord::Base
  belongs_to :user
  belongs_to :lists

  attr_accessor :show_url, :show_id, :show_object

  def self.search_shows_by_name(name)
    name = name
    url = "https://api.themoviedb.org/3/search/tv?api_key=5473abb95c13b13aa72928a042ee4e02&language=en-US&query=#{name}"
    response = self.get_api_response(url)
    response["results"].collect do |show|
      show_url = " " + "#{show["name"]}" + " " + "|" + " " + "#{show["overview"]}"
      @filtered_show = Show.new(name: show["name"], overview: show["overview"])

      @filtered_show.save
      @filtered_show
    end
  end

  def self.get_api_response(endpoint)
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end

end
