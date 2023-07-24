class RemoveColumnFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :production_status, null: false
  end
end
