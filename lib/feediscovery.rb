require 'httparty'


module Feediscovery
  class Feed
    attr_reader :href, :title, :rel, :type
    def initialize(params = {})
      @href   = params["href"]
      @title  = params["title"]
      @rel    = params["rel"]
      @type   = params["type"]
    end
  end
  
  include HTTParty
  base_uri 'http://feediscovery.appspot.com/'
  default_params :output => 'json'
  format :json
  
  def self.extract(url)
    get('/', :query => {:url => url}).map() {|f| Feed.new(f)}
  end
  
end