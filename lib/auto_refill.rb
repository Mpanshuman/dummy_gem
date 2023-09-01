# frozen_string_literal: true
require 'hola/create'
require_relative "auto_refill/version"

module AutoRefill
  def check_gem(value)
    refill = Refill.new(3,'some date')
    refill.create_auto_refill
  end
end
