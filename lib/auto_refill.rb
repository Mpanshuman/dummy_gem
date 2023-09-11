# frozen_string_literal: true
require 'auto_refill/refill'
require_relative "auto_refill/version"
require 'auto_refill/engine'

module AutoRefill
  def check_gem(source_id, start_date)
    # refill = Refill.new(source_id, start_date)
    # refill.create_auto_refill
    order_all = Order.all
    print "----------------------------------- \n"
    print "all order : #{order_all} \n"
    print "----------------------------------- \n"
  end
end
