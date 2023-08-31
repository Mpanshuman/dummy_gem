# frozen_string_literal: true

require 'rails/generators/base'
require 'securerandom'
require 'rails/generators'
module AutoRefill
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      include Rails::Generators::Migration
      def create_migration
        migration_template 'migration_template.rb', "db/migrate/#{migration_file_name}.rb"
      end
      def migration_file_name
        'add_custom_field_to_#{table_name}'
      end
      def table_name
        'auto_refill'
      end
    end
  end
end
