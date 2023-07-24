class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :payment_method, :integer, null: false, default: 0
    add_column :orders, :orders_status, :integer, null: false, default: 0
  end
end
