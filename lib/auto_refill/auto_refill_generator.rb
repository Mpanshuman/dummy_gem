# frozen_string_literal: true

require 'rails/generators/named_base'
require 'rails/generators'
module AutoRefill
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers

      namespace "auto_refill"
      source_root File.expand_path("../templates", __FILE__)

      desc "Generates a model with the given NAME (if one does not exist) with devise " \
           "configuration plus a migration file and devise routes."


      class_option :routes, desc: "Generate routes", type: :boolean, default: true

    #   def add_devise_routes
    #     devise_route  = "devise_for :#{plural_name}".dup
    #     devise_route << %Q(, class_name: "#{class_name}") if class_name.include?("::")
    #     devise_route << %Q(, skip: :all) unless options.routes?
    #     route devise_route
    #   end
    end
  end
end
