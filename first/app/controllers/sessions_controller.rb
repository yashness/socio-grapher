class SessionsController < ApplicationController
 
  def create
    auth = request.env["omniauth.auth"]
   user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]).tap do |u|
           u.update_attributes(:oauth_token => auth["credentials"]["token"]) if u
         end || User.from_omniauth(auth)
    session[:user_id] = user.id
   redirect_to :controller => 'home' , :action => 'start' , :notice => "Signed in!"
    
 

    #redirect_to(:controller => 'home' , :action => 'start')
    # :notice => "Signed in!"

  end

  def destroy
    session[:user_id] = nil
    redirect_to "/home/index", :notice => "Signed out!"
    #redirect_to "/home/start", :notice => "Signed in!"
  end

end

