class AddUrlToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :url, :string
  end
end
