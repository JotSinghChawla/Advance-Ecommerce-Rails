class Order < ApplicationRecord
    has_many :order_items
    before_save :set_subtotal

    def subtotal
        order_items.collect{ |oi| if oi.valid? then oi.quantity * oi.unit_price else 0 end }.sum
    end

    private

    def set_subtotal
        self.subtotal = subtotal
    end

end
