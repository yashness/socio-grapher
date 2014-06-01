OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :google_oauth2, '436279000613-f508bni8n8a5ej1r3pm4bi30us2f74bv.apps.googleusercontent.com', '5cnBxYbKP3Rc9ECiBGCEWYCP' , {:client_options => {:ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s}},:scope => 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/plus.stream.read'}
  #config.omniauth :google_oauth2,'436279000613-f508bni8n8a5ej1r3pm4bi30us2f74bv.apps.googleusercontent.com','5cnBxYbKP3Rc9ECiBGCEWYCP',{:access_type => 'offline', :approval_prompt => 'force', :scope => 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/plus.stream.read', name: 'google'}
  provider :google_oauth2, '436279000613-f508bni8n8a5ej1r3pm4bi30us2f74bv.apps.googleusercontent.com', '5cnBxYbKP3Rc9ECiBGCEWYCP' , {:client_options => {:ssl => {:ca_file => Rails.root.join('lib/assets/cacert.pem').to_s}},:scope => 'https://www.googleapis.com/auth/userinfo.profile'}
end
#end