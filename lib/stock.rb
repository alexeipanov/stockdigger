require 'httparty'
require 'base64'

module Stock

  class Shutterstock
    attr_accessor :headers

    def initialize
      @base_uri = 'https://api.shutterstock.com/v2/'
      @client_id = '617f8ecd027040e4c0a9'
      @client_secret = 'c11b974dd242055c6bd1301a26091c77c4dcb5db'
      @options = {
        view: 'minimal',
        fields: 'id,assets/preview/url'
       }
      @headers = {
        'Authorization' => 'Basic ' + Base64.strict_encode64("#{@client_id}:#{@client_secret}"),
        'User-Agent' => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0'
      }
    end

    def get_image(id)
      response = HTTParty.get("#{@base_uri}images/#{id}", query: @options, headers: @headers)
      # TODO Add error handling
      response['assets']['preview']['url']
    end

  end

end
