module DeviseAuthTokenLogin

  def login user
    request.headers.merge!(user.create_new_auth_token)
  end

end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include DeviseAuthTokenLogin
end
