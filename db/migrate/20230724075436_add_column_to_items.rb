class AddColumnToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :is_active, :boolean, null: false, default: true
  end
end

