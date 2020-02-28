class SessionsController < ApplicationController
before_action :set_clerk
  def new
    @clerk = Clerk.new
    render "sessions/new", :layout => false
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if clerk = Clerk.find_by(email: oauth_email)
        session[:clerk_id] = clerk.id
        redirect_to clerk_orders_path(clerk)
      else
        clerk = Clerk.new(email: oauth_email, password: SecureRandom.hex)
        if clerk.save 
          session[:clerk_id] = clerk.id
          redirect_to clerk_orders_path(clerk)
        else
          flash[:message] = "Something went wrong."
          @clerk = Clerk.new
          render "sessions/new", :layout => false
        end
      end
    else
      @clerk = Clerk.find_by(email: clerk_params[:email])
      if @clerk && @clerk.authenticate(clerk_params[:password])
        session[:clerk_id] = @clerk.id
        redirect_to clerk_orders_path(@clerk)
      else 
        @clerk = Clerk.new(clerk_params)
        @clerk.valid?
        flash[:message] = "Email or Password invalid."
        @clerk = Clerk.new
        render "sessions/new", :layout => false
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def login_and_redirect_to_root
    session[:clerk_id] = clerk.id
    redirect_to root_path
  end

  def clerk_params
      params.require(:clerk).permit(:email, :password, :title, :password_confirmation)
  end
end
