class ClerksController < ApplicationController

def new 
    @clerk = Clerk.new
end

def create
    @clerk = Clerk.new(clerk_params)
    if @clerk.save 
        session[:clerk_id] = @clerk.id
        redirect_to root_path
    else
        render :new
    end
end

private

def clerk_params
    params.require(:clerk).permit(:email, :password_digest, :title)
end
end
