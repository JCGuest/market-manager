class OrdersController < ApplicationController
before_action :set_clerk

    def index
        redirect_if_not_logged_in  
        @orders = @clerk.orders.all
    end

    def new
        @order = @clerk.orders.build
    end

    def create 
        # raise params.inspect
        @order = @clerk.orders.build(order_params)
        # @patron = Patron.new(params[:patron_attributes])
        if @order.save
            redirect_to clerk_orders_path
        else
            @order.patron.valid?
            render :new 
        end
    end

    def show 
        redirect_if_not_logged_in
        @order = Order.find(params[:id])
    end

    def edit
        redirect_if_not_logged_in
        @order = @clerk.orders.find_by(id: params[:id])  
        redirect_to clerk_orders_path(clerk), flash[:message] = "Order not found." if @order.nil?
        @patron = @order.patron
    end

    def update 
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to clerk_orders_path
    end

    def destroy 
        @order = Order.find(params[:id])
        @order.destroy
        redirect_to clerk_orders_path
    end


    private
    
    def order_params
        params.require(:order).permit(
            :item, :amount, :pick_up, :clerk_id, :complete,
            patron_attributes: [:name, :phone])
    end

end