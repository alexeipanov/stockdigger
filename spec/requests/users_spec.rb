require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      headers = {
        Authorization: auth_token(1)
      }
      get users_path, params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
