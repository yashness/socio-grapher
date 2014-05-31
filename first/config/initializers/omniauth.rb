OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '626876057403108', 'a9ef50a3be732ca0d94eebd8f331e96d', {:scope => 'email,user_birthday,read_stream,publish_stream, user_friends', :display => 'popup'}
end