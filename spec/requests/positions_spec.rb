require 'rails_helper'

RSpec.describe "Positions", type: :request do
  describe "GET /positions" do
    it "works! (now write some real specs)" do
      headers = {
        Authorization: auth_token(1)
      }
      get collection_positions_path(1), params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
