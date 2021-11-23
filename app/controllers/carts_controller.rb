class CartsController < ApplicationController

  def success
  end

  def create

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'inr',
          product_data: {
            name: 'T-shirt',
          },
          unit_amount: 500,
        },
        quantity: 1,
      }],
      mode: 'payment',
      discounts: [{
        coupon: '123456'
      }],
      success_url: 'http://localhost:3000/carts/success',
      cancel_url: 'http://localhost:3000/carts',
    })
    respond_to do |format|
      format.js
    end

  end

  def show
    @order_items = current_order.order_items
  end
end
