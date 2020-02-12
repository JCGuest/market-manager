class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if clerk = Clerk.find_by(email: oauth_email)
        session[:clerk_id] = clerk.id
        redirect_to root_path
      else
        clerk = Clerk.new(email: oauth_email, password: SecureRandom.hex)
        if clerk.save 
        session[:clerk_id] = clerk.id
        redirect_to root_path
        else
          render :new
        end
      end
    else
      clerk = Clerk.find_by(email: params[:email])
      if clerk && clerk.authenticate(params[:password])
        session[:clerk_id] = clerk.id
        redirect_to root_path
      else 
        render 'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def login_and_redirect_to_root
    session[:clerk_id] = clerk.id
    redirect_to root_path
  end
end
