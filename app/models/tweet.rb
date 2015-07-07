class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :tweet_user
end
