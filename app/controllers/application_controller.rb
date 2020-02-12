class ApplicationController < ActionController::Base
    helper_method :current_clerk

    def logged_in?
        !!current_clerk
    end

    def current_clerk
        @current_clerk ||= Clerk.find(session[:clerk_id]) if session[:clerk_id]
    end

end
