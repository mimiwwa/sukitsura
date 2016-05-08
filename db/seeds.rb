# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(email: 'tw_user@testtest.com', password: 'aoyama1choume', nickname: 'Twuser')

require "csv"

articles_csv = CSV.readlines("db/articles.csv")
articles_csv.shift
articles_csv.each do |row|
  Article.create(text: row[1], user_id: row[4], tw_userno: row[5], tw_username: row[6], tw_userid: row[7], tw_id: row[8])
end