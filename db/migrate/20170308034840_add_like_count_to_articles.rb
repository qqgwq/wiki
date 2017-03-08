class AddLikeCountToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :like_count, :integer, default: 0
  end
end
