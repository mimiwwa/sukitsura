namespace :regular_task do
desc "ツイートのスクレイピング"

  task :scraping => :environment do
    Scraping.tweetscraping
  end

desc "コメントがついたら返信する"

  task :bot => :environment do
    Bot.tweetbot
  end

end
