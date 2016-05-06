class AddtwIconToAritcles < ActiveRecord::Migration
  def change
    add_column :articles, :tw_icon, :string
  end
end
