class CreateAutoRefill < ActiveRecord::Migration[<%= Rails::VERSION::MAJOR %>.<%= Rails::VERSION::MINOR %>]
  def change
    create_table :<%= table_name %> do |t|
    t.bigint :order_id
    t.date :start_date
    t.string :status
    end
  end
end