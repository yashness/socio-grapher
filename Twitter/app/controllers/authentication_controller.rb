require 'twitter'
class AuthenticationController < ApplicationController

  def twitter
    redirect_to(request.env["omniauth.auth"].to_yaml)
  end

  def home

  end
end
