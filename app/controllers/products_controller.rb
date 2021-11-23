class ProductsController < ApplicationController

  def index
    @items = Item.all
    
    
    if request.post?

      # render 'hello'
      # redirect_to '/products/hello'

      keyword="%" + params[:search].to_s + "%"
      keyword = keyword.downcase

      if params[:search].present?
        @items = Item.where("name LIKE ? OR category LIKE ? OR colors LIKE ? OR sizes LIKE ?", keyword, keyword, keyword, keyword)

        # @items = Item.find_by_sql ["Select * from items WHERE name like ?",keyword]

        puts "Item Value ======================= #{@items.inspect}"

        @order_item = current_order.order_items.new
        render 'index'
      else
        @items = Item.all
        @order_item = current_order.order_items.new
      end

    end

  end

  private 

  def product_params
    params.require(:item).permit(:search)
  end

end
