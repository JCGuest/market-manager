class OrdersController < ApplicationController
before_action :set_clerk

    def index
        redirect_to login_path if !logged_in?
        @orders = @clerk.orders.all 
    end

    def new
        @order = @clerk.orders.build
    end

    def create 
        # raise params.inspect
        @order = @clerk.orders.build(order_params)
        if @order.save 
            redirect_to clerk_orders_path
        else
            render :new 
        end
    end


    private
    
    def order_params
        params.require(:order).permit(
            :item, :amount, :pick_up, :clerk_id, :complete,
            patron_attributes: [:name, :phone])
    end

    def set_clerk
        @clerk = Clerk.find_by(id: session[:clerk_id])
    end

end