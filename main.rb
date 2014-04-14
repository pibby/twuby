require 'bundler/setup'
require 'data_mapper'
require 'sinatra'
require 'slim'
require 'twitter'

class TweetQueue
	include DataMapper::Resource
	property :id,           Serial
	property :name,         String, :length => 140, :required => true
end

## For heroku deploy, you must add the "Heroku Postgres" add-on from https://addons.heroku.com/heroku-postgresql and the "Heroku Scheduler" add-on from https://addons.heroku.com/scheduler
configure do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://user:password@host:port/database")
  DataMapper.auto_upgrade!
end

## Register a new app at http://app.twitter.com to obtain this info
$client = Twitter::REST::Client.new do |config|
	config.consumer_key = ""
	config.consumer_secret = ""
	config.access_token = ""
	config.access_token_secret = ""
end

def tweetit
	current = TweetQueue.first.name  # grab the first record from the database
	$client.update(current) # tweet it
	TweetQueue.first.destroy # delete it from the database
end

## You'll need some type of user authentication so random people don't mess with your queue!
use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['admin', 'password']  
end

## Sinatra routes:
get '/' do
	@tweets = TweetQueue.all
	slim :index
end

post '/' do
	TweetQueue.create params[:qtweet]
	redirect to('/')
end

delete '/qtweet/:id' do
	TweetQueue.get(params[:id]).destroy
	redirect to('/')
end