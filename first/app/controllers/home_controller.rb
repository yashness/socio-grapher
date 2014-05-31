class HomeController < ApplicationController
  def index
    if not current_user.nil?
      redirect_to :action => 'start'
    end
  end

  def start

  	graph = Koala::Facebook::OAuth.new
  	if not current_user.nil?
  		@user=current_user

    
  	 @token=graph.exchange_access_token(@user.oauth_token) 
  	 @trial=Koala::Facebook::API.new(@token)
		 @profile = @trial.get_object("me")

     @feeds=@trial.get_connection('me','feed')
		#@friends = @trial.get_connections(@meme["id"],"friends")
		#@trial.put_wall_post("Cindrella", {"name" => "trial app" , "description" => "Get your facefook,twitter and G+ activities here"})
    

    logger.info("==========================================================")
	#	logger.info(@feeds.kind_of(Hash))
	end
  end

end
