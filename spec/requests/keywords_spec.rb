require 'rails_helper'

RSpec.describe "Keywords", type: :request do
  describe "GET /keywords" do
    it "works! (now write some real specs)" do
      headers = {
        Authorization: auth_token(1)
      }
      get collection_keywords_path(1), params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
