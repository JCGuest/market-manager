class OrdersController < ApplicationController
before_action :set_clerk

    def index
        redirect_to login_path if !logged_in?
        @orders = @clerk.orders.all 
    end

    def new
        @order = @clerk.orders.build
    end


    private

    def set_clerk
        @clerk = Clerk.find_by(id: session[:clerk_id])
    end

end