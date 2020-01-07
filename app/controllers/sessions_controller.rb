class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to news_items_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
