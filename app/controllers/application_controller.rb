class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  #def current_user
    # Note: we want to use "find_by_id" because it's OK to return a nil.
    # If we were to use User.find, it would throw an exception if the user can't be found.
    #@current_user ||= User.find_by_id(session[:userid]) if session[:userid]
  #end

begin

  def current_user
    if session[:userid]
      @current_user ||= User.find(session[:userid])
    else
      @current_user = nil
    end
  end
end
end
