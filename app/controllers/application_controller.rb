class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    # authorise admin user to make sure admin
  def authorize_admin!
    if user_signed_in? && current_user.try(:is_admin?)
      return
    elsif user_signed_in?
      flash[:notice] = 'You are not authorised to visit this page'
      redirect_to :root
    else
      flash[:notice] = 'Please sign in'
      redirect_to new_user_session_path
    end
  end
end
