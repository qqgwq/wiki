class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.string :auth_token
      t.timestamps
    end

    add_index :users, :phone, unique: true
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
