class RemoveColumnFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :payment_method, :integer, null: false
    remove_column :orders, :orders_status, null: false
  end
end
