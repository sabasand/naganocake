class AddColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :family_name_kana, :string, null: false, default: ""
    add_column :customers, :first_name_kana, :string, null: false, default: ""
    add_column :customers, :is_deleted, :boolean, null: false
  end
end
