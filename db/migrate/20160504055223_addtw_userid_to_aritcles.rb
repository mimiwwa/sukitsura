class AddtwUseridToAritcles < ActiveRecord::Migration
  def change
    add_column :articles, :tw_userno, :integer
    add_column :articles, :tw_username, :string
    add_column :articles, :tw_userid, :string
  end
end


