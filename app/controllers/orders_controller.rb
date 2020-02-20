class OrdersController < ApplicationController
    before_action :set_clerk
    
        def index
            redirect_if_not_logged_in  
            @orders = @clerk.orders.all
        end
    
        def new
            flash[:message] = nil
            @order = @clerk.orders.build
        end
    
        def create 
            @order = @clerk.orders.build(order_params)
            if @order.save
                redirect_to clerk_orders_path
            else
                render :new 
            end
        end
    
        def show 
            redirect_if_not_logged_in
            @order = @clerk.orders.find(params[:id])
        end
    
        def edit
            flash[:message] = nil
            redirect_if_not_logged_in
            @order = @clerk.orders.find(params[:id])
        end   


        def update 
            @order = Order.find(params[:id])
            update = @clerk.orders.build(order_params)
            if update.valid?
                @order.update(order_params)
               redirect_to clerk_orders_path
            else
                 @order = @clerk.orders.new(order_params)
                @order.valid?
                render :edit
            end
        end
    
        def destroy 
            @order = Order.find(params[:id])
            @order.destroy
            redirect_to clerk_orders_path
        end

        def today
            redirect_if_not_logged_in
            @orders = Order.due(Date.today)
        end
    
    
        private
        
        def order_params
            params.require(:order).permit(
                :item, :amount, :pick_up, :clerk_id, :complete, :patron_id, 
                patron_attributes: [:name, :phone])
        end

    end