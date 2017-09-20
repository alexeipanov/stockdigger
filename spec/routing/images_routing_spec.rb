require "rails_helper"

RSpec.describe ImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/collections/1/images").to route_to("images#index", collection_id: '1')
    end

    it "routes to #show" do
      expect(:get => "/collections/1/images/1").to route_to("images#show", collection_id: '1', id: '1')
    end

    it "routes to #create" do
      expect(:post => "/collections/1/images").to route_to("images#create", collection_id: '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/collections/1/images/1").to route_to("images#update", collection_id: '1', id: '1')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/collections/1/images/1").to route_to("images#update", collection_id: '1', id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/collections/1/images/1").to route_to("images#destroy", collection_id: '1', id: '1')
    end

  end
end
