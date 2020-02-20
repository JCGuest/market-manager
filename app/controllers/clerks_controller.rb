class ClerksController < ApplicationController

def new 
    @clerk = Clerk.new
    render "clerks/new", :layout => false
end

def create
    @clerk = Clerk.new(clerk_params)
    if @clerk.save 
        session[:clerk_id] = @clerk.id
        redirect_to clerk_orders_path(@clerk)
    else
        @clerk.valid?
        render "clerks/new", :layout => false
    end
end

private

def clerk_params
    params.require(:clerk).permit(:email, :password, :title, :password_confirmation)
end

end
