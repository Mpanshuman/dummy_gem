# frozen_string_literal: true

require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class AutoRefillGenerator < ActiveRecord::Generators::Base
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

      def inject_devise_content
        content = model_contents

        class_path = if namespaced?
          class_name.to_s.split("::")
        else
          [class_name]
        end

        indent_depth = class_path.size - 1
        content = content.split("\n").map { |line| "  " * indent_depth + line } .join("\n") << "\n"

        inject_into_class(model_path, class_path.last, content) if model_exists?
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

      def rails5_and_up?
        Rails::VERSION::MAJOR >= 5
      end

      def rails61_and_up?
        Rails::VERSION::MAJOR > 6 || (Rails::VERSION::MAJOR == 6 && Rails::VERSION::MINOR >= 1)
      end

      def postgresql?
        ar_config && ar_config['adapter'] == 'postgresql'
      end

      def ar_config
        if ActiveRecord::Base.configurations.respond_to?(:configs_for)
          if rails61_and_up?
            ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "primary").configuration_hash
          else
            ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, spec_name: "primary").config
          end
        else
          ActiveRecord::Base.configurations[Rails.env]
        end
      end

     def migration_version
       if rails5_and_up?
         "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
       end
     end

     def primary_key_type
       primary_key_string if rails5_and_up?
     end

     def primary_key_string
       key_string = options[:primary_key_type]
       ", id: :#{key_string}" if key_string
     end
    end
  end
end
