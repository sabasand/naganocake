class RemoveColumnFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :rubi_family_name, default: "", null: false
    remove_column :customers, :rubi_first_name, default: "", null: false
  end
end
