class ChangeDatatypeTwusernoOfArticles < ActiveRecord::Migration
  def change
    change_column :articles, :tw_userno, :text

  end
end
