class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
      t.string      :name
      t.text        :text
      t.timestamps

    end
  end
end
