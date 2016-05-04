class Scraping
  def self.tweetscraping
    day = Array.new(2)
    day[0] = Time.now
    day[1] = day[0].strftime("%Y%m%d_%H%M%S")

    client = Twitter::Client.new(
      :consumer_key => "4NJXgJtZqATcW9YD6QWaSvwSp",
      :consumer_secret => "WAFdQqtvaGHLmqy0DRNxOJZS3WYwgYQ7Qsx7mUawlAvOQblfk9",
      :oauth_token => "4839964664-Inr2Znxp5IuxmlyCKx9ZpUIqZ5ntZX6IZ8a6oL6",
      :oauth_token_secret => "tu4aJWuxOeqcgCiG8nNs2uERHvCMe4OJJsAxh2aQ63bcW"
    )

    query = "好きすぎてつらい+彼氏 OR 好きすぎてつらい+恋人 OR 好きすぎてつらい+彼女 OR 好きすぎてつらい+片思い OR 好きすぎてツラい+彼氏 OR 好きすぎてツラい+恋人 OR 好きすぎてツラい+彼女 OR 好きすぎてツラい+片思い OR 好きすぎて辛い+彼氏 OR 好きすぎて辛い+恋人 OR 好きすぎて辛い+彼女 OR 好きすぎて辛い+片思い"

    since_id = nil
    results = client.search(query, :count => 100, :result_type => "recent",  exclude: "retweets", since_id: since_id)

    results.attrs[:statuses].each do |tweet|
      article= Article.where(text: tweet[:text],user_id: '1',tw_username: tweet[:user][:name],tw_userno: tweet[:user][:id_str],tw_userid: tweet[:user][:screen_name],tw_id: tweet[:id_str]).first_or_initialize
      article.save
    end

  end
end

