class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return nil if session[:user_id].blank?

    if @current_user.blank?
      records = User.where(id: session[:user_id])
      return nil if records.blank?

      @current_user = records.first
    end

    @current_user
  end

  def ensure_admin
    return redirect_to(root_path), notice: 'Your Unauthorized Access Attempt has been logged.' unless current_user.present? && current_user.is_admin
    true
  end
end
