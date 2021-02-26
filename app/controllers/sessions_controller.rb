class SessionsController < ApplicationController
  # def create
  #   user = User.from_omniauth(request.env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to news_items_path
  # end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def validate
  	found = User.validate(params[:name], params[:secret])
  	redirect_to root_path unless found.present?

  	session[:user_id] = found.first.id
  	redirect_to news_items_path
  end
end
