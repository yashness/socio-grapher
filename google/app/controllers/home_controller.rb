class HomeController < ApplicationController
  def show
  end

  def connect
  	render(:text=>"hi..this is connect!")
  	user=User.find(params[:id])
  	@token=user.oauth_token
  	client = Google::APIClient.new
    plus = client.discovered_api('plus')
    result=Array.new

    #client.authorization = nil
  	client.authorization.client_id ="436279000613-f508bni8n8a5ej1r3pm4bi30us2f74bv.apps.googleusercontent.com"
  	client.authorization.client_secret = "5cnBxYbKP3Rc9ECiBGCEWYCP"
  	client.authorization.access_token = @token
    #client.authorization.scope = "https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile"
    client.authorization.scope = "https://www.googleapis.com/auth/userinfo.profile"
    client.authorization.redirect_uri = "http://localhost:3000/auth/google_oauth2/callback"
  	
  	result = client.execute(:api_method => plus.people.get ,:parameters => {:collection => 'public', :userId => 'user.id', :maxResults => 50 , :pageToken => 'nextPageToken'})
    puts result
    puts JSON.pretty_generate(result.data.to_hash)
    #jj puts result.data.to_hash
    #JSON.parse(result)
  end
end
