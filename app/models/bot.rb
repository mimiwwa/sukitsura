class Bot
  def self.tweetbot

    client = Twitter::Client.new(
      :consumer_key => "GEKxKybmHT8iV70HLB6ws9w8E",
      :consumer_secret => "1YwWMBEnrs3xg3ENoUcOOK1pLJLp8DxaZjJVfggd9Ca4HwTwSk",
      :oauth_token => "2334724627-zxO0B3bkBjivs0vNPJC9B509hlI6tB1FpspcpJ9",
      :oauth_token_secret => "wHCt1KG5Wold6uWLOtMwJnJQywDIfxHB1J7k3w675AYJ6"
    )

    now = Time.now
    ten_min_before = now - 600
    comments = Comment.joins(:article).where('comments.created_at >= ?', ten_min_before).merge(Article.where(user_id: 1))

    comments.each do |comment|
      tweettext="@" + comment.article.tw_userid.to_s + "さんの好きすぎてつらい気持ちに、共感のコメントがつきました。「" + comment.text[1, 15] + "… http://localhost:3000/articles/" + comment.article.id.to_s

      client.update(tweettext)
      end
  end

end




