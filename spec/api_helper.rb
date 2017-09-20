module ApiHelper
  def auth_token(user_id)
	Knock::AuthToken.new(payload: { sub: user_id }).token
  end

  def prepare_request(user_id)
    token = auth_token(user_id)
    request.headers.merge!({ Authorization: "Bearer #{token}" })
  end
end

RSpec.configure do |config|
  config.include ApiHelper
end