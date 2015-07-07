require 'byebug'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  @user = TweetUser.find_by_username("WongYouJing1")
  @user.tweets.create(text: params[:tweet])
  # byebug
  $client.update(params[:tweet])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets
  # byebug
  erb :tweets, layout:false
end