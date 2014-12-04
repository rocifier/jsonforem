class ApplicationController < ActionController::Base

protected
  def current_user
    User.find(1)
  end
  helper_method :current_user
end
