require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: users(:one).id }).token

    {
      Authorization: "Bearer #{token}"
    }
  end

  test 'responds successfully' do
    get '/profile', headers: authenticated_header

    assert_response :success
  end
end
