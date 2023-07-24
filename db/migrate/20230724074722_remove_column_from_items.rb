class RemoveColumnFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :is_active, null: false
  end
end
