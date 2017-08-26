class PickPositionsJob < ApplicationJob
  queue_as :default
  require 'stock'

  def perform(*args)
    shutter = Stock::Shutterstock.new
    Collection.all.each do |collection|
      collection.keywords.each do |keyword|
        result = shutter.search(keyword.keyword)
        collection.images.each do |image|
          Position.create({ :image_id => image.id, :keyword_id => keyword_id, :position => result.index(image.image) })
        end
      end
    end
  end
end
