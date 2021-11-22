class OrderItemsController < ApplicationController

    def create
        @order = current_order
        @order_item = @order.order_items.new(oi_params)
        @order.save
        session[:order_id] = @order.id
    end


    def update
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(oi_params)

        @order_items = @order.order_items       # To reassign value for using AJAX
    end

    
    def destroy
        @order = current_order
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy

        @order_items = @order.order_items      # To reassign value for using AJAX
    end



    private 

        def oi_params
            params.require(:order_item).permit(:item_id, :quantity)
        end

end
