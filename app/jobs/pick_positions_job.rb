class PickPositionsJob < ApplicationJob
  queue_as :default
  require 'stock'

  def perform
    shutter = Stock::Shutterstock.new(client_id: Rails.application.secrets.shutterstock_client_id, client_secret: Rails.application.secrets.shutterstock_client_secret)
    positions = []
    Collection.all.each do |collection|
      collection.keywords.each do |keyword|
        result = shutter.search(keyword.keyword)
        collection.images.each do |image|
          position = result.index { |item| item['id'] == image.image }
          position += 1 unless position.nil?
          positions << { image_id: image.id, keyword_id: keyword.id, position: position }
        end
      end
    end
    begin
      Position.create!(positions)
      true
    rescue StandardError
      false
    end
  end
end
