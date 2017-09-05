require 'httparty'
require 'base64'

module Stock
  class Shutterstock
    attr_reader :headers
    def initialize(credentials)
      @base_uri = 'https://api.shutterstock.com/v2/'
      @client_id = credentials[:client_id]
      @client_secret = credentials[:client_secret]
      @headers = {
        'Authorization' => 'Basic ' + Base64.strict_encode64("#{@client_id}:#{@client_secret}"),
        'User-Agent' => 'Shutterstock API client'
      }
    end

    def test_auth
      options = {
        id: 1
      }
      response = HTTParty.get("#{@base_uri}images", query: options, headers: @headers)
      response.code
    end

    def get_image(id)
      options = {
        view: 'minimal',
        fields: 'id,assets/large_thumb/url'
      }
      response = HTTParty.get("#{@base_uri}images/#{id}", query: options, headers: @headers)
      response.code.eql?(200) ? response['assets']['large_thumb']['url'] : ''
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
      response = HTTParty.get("#{@base_uri}images/search", query: options, headers: @headers)
      response.code.eql?(200) ? response['data'] : []
    end
  end
end
