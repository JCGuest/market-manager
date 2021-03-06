class ApplicationController < ActionController::Base
    helper_method :current_clerk
    helper_method :logged_in?

    def hello
        render "application/hello", :layout => false  
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

    def redirect_if_not_logged_in
        if !logged_in?
          redirect_to login_path
        end
    end

end
