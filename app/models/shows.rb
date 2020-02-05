require 'json'
require 'net/http'
require 'pry'

class Show < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  attr_accessor :show_url, :show_id, :show_object

  @filter = {}

  def initialize(url)
    self.show_url = url
  end

  def self.search_shows_by_name(name)
    name = name
    url = "https://api.themoviedb.org/3/search/tv?api_key=5473abb95c13b13aa72928a042ee4e02&language=en-US&query=#{name}"
    response = self.get_api_response(url)
    response["results"].collect do |show|
      show_url = " " + "#{show["name"]}" + " " + "|" + " " + "#{show["overview"]}"
    #  Show.new(show_url) creates new instance objects, makes list, yet no way of indexing objects
    #  @filter.merge(show_url) type error, no conversion of string to hash
    #  @filter[:new_show] = show_url works but renders blanks
    #  @filter << show_url works, but does not allow me to slice the array, combines all results into one value, cant call upon seperate indexes past 0 as they = nil

    end
  end

  def self.get_api_response(endpoint)
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end

end
