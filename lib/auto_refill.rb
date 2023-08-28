# frozen_string_literal: true

require_relative "auto_refill/version"

module AutoRefill
  def check_gem(value)
    print "----------------------------------------------------------- \n"
    print "Gem file has been called ; #{value} \n"
    print "----------------------------------------------------------- \n"
  end
end
