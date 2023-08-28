# frozen_string_literal: true

require 'rails/generators/base'
require 'securerandom'
require 'rails/generators'
module AutoRefill
  module Generators

    class InstallGenerator < Rails::Generators::Base
      def code_that_runs
        puts "Hi"
      end
    end
  end
end
