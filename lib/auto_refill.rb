# frozen_string_literal: true
require 'auto_refill/refill'
require_relative "auto_refill/version"

module AutoRefill
  def check_gem(source_id, start_date)
    refill = Refill.new(source_id, start_date)
    refill.create_auto_refill
  end
end
