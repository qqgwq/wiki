class AddIsDeletedToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :is_deleted, :boolean, default: false
    add_index :comments, :is_deleted
  end
end
