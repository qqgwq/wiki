class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :likeable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
