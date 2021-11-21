class OrderItemsController < ApplicationController


    def create
        @order = current_order
        @order_item = @order.order_items.new(oi_params)
        @order.save
        session[:order_id] = @order.id
    end

    private 

        def oi_params
            params.require(:order_item).permit(:item_id, :quantity)
        end

end
