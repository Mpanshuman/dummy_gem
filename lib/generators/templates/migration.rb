class AutoRefillCreate<%= table_name.camelize %> < ActiveRecord::Migration[<%= Rails::VERSION::MAJOR %>.<%= Rails::VERSION::MINOR %>]
  def change
    # Your migration code here
    create_table :<%= table_name %> do |t|

    t.bigint :order_id
    t.date :start_date
    t.string :status

  end
end