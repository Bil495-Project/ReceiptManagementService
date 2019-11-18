class HomeController < ApplicationController
  helper_method :current_user

  begin

    def index
      if params[:search]
        @search_term = params[:search]
        @receipts = Receipt.search(@search_term)
    end

    end
    def current_user
      if session[:userid]
        puts "in home controller current user has set.."

        @current_user ||= User.find(session[:userid])
      else
        puts "in home controller current user is NIL"
        @current_user = nil
      end
    end
  end
end
