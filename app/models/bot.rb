class Bot
  def self.tweetbot

    client = Twitter::Client.new(
      :consumer_key => Settings.twitter[:consumer_key],
      :consumer_secret => Settings.twitter[:consumer_secret],
      :oauth_token => Settings.twitter[:oauth_token],
      :oauth_token_secret => Settings.twitter[:oauth_token_secret]
    )

    now = Time.now
    ten_min_before = now - 600
    comments = Comment.joins(:article).where('comments.created_at >= ?', ten_min_before).merge(Article.where(user_id: 1))

    comments.each do |comment|
      tweettext="@" + comment.article.tw_userid.to_s + "さんの好きすぎてつらい気持ちに、共感のコメントがつきました。「" + comment.text[0, 15] + "… http://sukitsura.herokuapp.com/articles/" + comment.article.id.to_s

      client.update(tweettext)
      end
  end

end




