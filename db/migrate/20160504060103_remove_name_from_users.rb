class RemoveNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tw_username, :string
    remove_column :users, :tw_userid, :string
    remove_column :users, :tw_userno, :integer

  end
end
