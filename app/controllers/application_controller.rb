class ApplicationController < ActionController::Base

  before_action :user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user
    @user = current_user
  end

end
