class ApplicationController < ActionController::Base
    helper_method :current_clerk

    def hello
        redirect_to login_url if !logged_in?
    end

    def logged_in?
        !!current_clerk
    end

    def current_clerk
        @current_clerk ||= Clerk.find(session[:clerk_id]) if session[:clerk_id]
    end

    def set_clerk
        @clerk = Clerk.find_by(id: session[:clerk_id])
    end

end
