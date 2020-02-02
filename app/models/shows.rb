require 'json'
require 'net/http'

class Show < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  attr_accessor :show_url

  def initialize(url)
    self.show_url = url
  end

  def self.search_shows_by_name(keyword)
    keyword = keyword
    url = "https://api.themoviedb.org/3/search/tv?api_key=5473abb95c13b13aa72928a042ee4e02&language=en-US&query=#{keyword}"
    response = self.get_api_response(url)
  end

  def self.get_api_response(endpoint)
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end
end
