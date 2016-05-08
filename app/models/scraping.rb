class Scraping
  def self.tweetscraping
    day = Array.new(2)
    day[0] = Time.now
    day[1] = day[0].strftime("%Y%m%d_%H%M%S")

    client = Twitter::Client.new(
      :consumer_key => "GEKxKybmHT8iV70HLB6ws9w8E",
      :consumer_secret => "1YwWMBEnrs3xg3ENoUcOOK1pLJLp8DxaZjJVfggd9Ca4HwTwSk",
      :oauth_token => "2334724627-zxO0B3bkBjivs0vNPJC9B509hlI6tB1FpspcpJ9",
      :oauth_token_secret => "wHCt1KG5Wold6uWLOtMwJnJQywDIfxHB1J7k3w675AYJ6"
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

