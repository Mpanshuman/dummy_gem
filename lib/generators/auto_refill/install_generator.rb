# frozen_string_literal: true

require 'rails/generators/base'
require 'securerandom'
require 'rails/generators'
module AutoRefill
  module Generators

    class InstallGenerator < Rails::Generators::Base
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      class_option :primary_key_type, type: :string, desc: "The type for primary key"

      source_root File.expand_path("../templates", __FILE__)

      def copy_auto_refill_migration
        if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
          migration_template "migration_existing.rb", "#{migration_path}/add_devise_to_#{table_name}.rb", migration_version: migration_version
        else
          migration_template "migration.rb", "#{migration_path}/devise_create_#{table_name}.rb", migration_version: migration_version
        end
      end

      def generate_model
        invoke "active_record:model", [name], migration: false unless model_exists? && behavior == :invoke
      end

      def migration_data
        <<RUBY
          ## Database authenticatable
          t.bigint :order_id,              null: false, default: nil
          t.date :start_date,              null: false, default: nil
          t.string :status,              null: false, default: 'active'
          ## Rememberable
          t.datetime :remember_created_at

        RUBY
      end
    end
  end
end
