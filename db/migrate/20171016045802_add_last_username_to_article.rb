class AddLastUsernameToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :last_username, :string
  end
end
