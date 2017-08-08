class AddImageToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :image, :string
  end
end
