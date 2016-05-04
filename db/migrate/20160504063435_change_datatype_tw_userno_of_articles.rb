class AddDatatypeTwUsernoOfArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tw_id, :string
  end
end
