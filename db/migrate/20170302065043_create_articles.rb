class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :comments_count
      t.integer :likes_count
      t.integer :views_count, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
    add_index :articles, :user_id, unique: true
    add_index :articles, :category_id, unique: true
  end
end
