class AddUsernameLowerAndEmailLowerToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name_lower, :string
    add_column :users, :email_lower, :string
  end
end
