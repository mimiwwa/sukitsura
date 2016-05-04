class AddtwUseridToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tw_userno, :integer
    add_column :users, :tw_username, :string
    add_column :users, :tw_userid, :string

  end
end
