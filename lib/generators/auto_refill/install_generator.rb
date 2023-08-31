# frozen_string_literal: true

require 'rails/generators/base'
require 'securerandom'
require 'rails/generators'
module AutoRefill
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)
      include Rails::Generators::Migration
      def create_migration_auto_refill
        migration_template 'migration.rb', "db/migrate/#{migration_file_name}.rb"
      end
      def migration_file_name
        'add_custom_field_to_auto_refill'
      end
      def table_name
        'auto_refill'
      end
      private
      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end
    end
  end
end
