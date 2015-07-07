class TweetUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets

  def fetch_tweets!
    self.tweets.destroy_all
    $client.user_timeline(self.username, {count: 10})
  end

  def tweets_stale?
    last_updated_at = self.tweets.last.updated_at
    diff_time = Time.now - last_updated_at
    if diff_time > 900
     true
    else
     false
    end
  end

end
