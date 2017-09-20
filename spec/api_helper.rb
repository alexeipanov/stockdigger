module ApiHelper
  def prepare_request(user_id)
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    request.headers.merge!({ Authorization: "Bearer #{token}" })
  end
end

RSpec.configure do |config|
  config.include ApiHelper
end