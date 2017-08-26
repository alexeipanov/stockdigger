require 'httparty'
require 'base64'

module Stock

  class Shutterstock
    attr_accessor :headers, :client_id, :client_secret, :base_uri, :options

    def initialize
      self.base_uri = 'https://api.shutterstock.com/v2/'
      self.client_id = '617f8ecd027040e4c0a9'
      self.client_secret = 'c11b974dd242055c6bd1301a26091c77c4dcb5db'
      self.headers = {
        'Authorization' => 'Basic ' + Base64.strict_encode64("#{self.client_id}:#{self.client_secret}"),
        'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'
      }
    end

    def get_image(id)
      options = {
        view: 'minimal',
        fields: 'id,assets/large_thumb/url'
      }
      response = HTTParty.get("#{self.base_uri}images/#{id}", query: options, headers: self.headers)
      # TODO Add error handling
      response['assets']['large_thumb']['url']
    end

    def search(keyword)
      options = {
        fields: 'data/id',
        license: 'commercial',
        page: 1,
        per_page: 50,
        query: keyword,
        sort: 'popular',
        view: 'minimal'
      }
      response = HTTParty.get("#{self.base_uri}images/search", query: options, headers: self.headers)
      response['data']
    end

  end

end
