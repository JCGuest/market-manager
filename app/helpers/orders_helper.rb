module OrdersHelper

    def order_complete?(order)
        if order.complete
            return "yes"
        else !order.complete
            return "no"
        end
    end
    
end