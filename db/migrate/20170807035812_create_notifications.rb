class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id, index: true
      t.belongs_to :subject, polymorphic: true, index: true
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
