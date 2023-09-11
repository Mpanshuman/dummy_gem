# frozen_string_literal: true
require 'auto_refill/refill'
require_relative "auto_refill/version"
require 'auto_refill/engine'

module AutoRefill
  def check_gem(source_id, start_date)
    # refill = Refill.new(source_id, start_date)
    # refill.create_auto_refill
    order_all = Order.all.last
    refill = Subscription.create!({
      order_id: order_all.id,
      status: 'active',
    })
    print "----------------------------------- \n"
    print "all order : #{refill} \n"
    print "----------------------------------- \n"
  end
end
