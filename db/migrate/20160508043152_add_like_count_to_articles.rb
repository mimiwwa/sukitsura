class AddLikeCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :like_count, :integer
  end
end
