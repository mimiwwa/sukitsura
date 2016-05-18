class Scraping
  def self.tweetscraping
    day = Array.new(2)
    day[0] = Time.now
    day[1] = day[0].strftime("%Y%m%d_%H%M%S")

    client = Twitter::Client.new(
      :consumer_key => Settings.twitter[:consumer_key],
      :consumer_secret => Settings.twitter[:consumer_secret],
      :oauth_token => Settings.twitter[:oauth_token],
      :oauth_token_secret => Settings.twitter[:oauth_token_secret]
    )

    query = "好きすぎてつらい+彼氏 OR 好きすぎてつらい+恋人 OR 好きすぎてつらい+彼女 OR 好きすぎてつらい+片思い OR 好きすぎてツラい+彼氏 OR 好きすぎてツラい+恋人 OR 好きすぎてツラい+彼女 OR 好きすぎてツラい+片思い OR 好きすぎて辛い+彼氏 OR 好きすぎて辛い+恋人 OR 好きすぎて辛い+彼女 OR 好きすぎて辛い+片思い"

    since_id = Article.where(user_id: 1).last.tw_id
    results = client.search(query, :count => 100, :result_type => "recent",  exclude: "retweets", since_id: since_id)


    results.attrs[:statuses].each do |tweet|
      article= Article.where(text: tweet[:text]).first_or_initialize
      article.user_id ='1'
      article.tw_username = tweet[:user][:name]
      article.tw_userno = tweet[:user][:id_str]
      article.tw_userid = tweet[:user][:screen_name]
      article.tw_id = tweet[:id_str]
      article.tw_icon =tweet[:user][:profile_image_url_https]
      article.save
    end

  end
end

