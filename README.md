# Twuby - A Twitter Tweet Scheduler in Ruby Powered by Sinatra

Unwilling to pay for an account at BufferApp to queue more than 10 tweets, I decided to write my own Twitter Scheduler. It's ready for deployment to Heroku, please see comments in `main.rb`.

## What It Does
- Allows you to enter a username and password of your choosing, stored in `main.rb` so people cannot randomly delete or add items to your tweet queue
- Allows you to enter tweet text, up to 140 characters, which is then stored in a database
- Allows you to delete queued tweets
- Tweets the contents of the first item in the database, then deletes it from the database
- Using Heroku Scheduler, you can call the `Rakefile` task to send your tweets at whatever interval you choose
- Works anywhere you can access a website (Tested in Chrome, Firefox, Safari, iPad - iOS7, iPhone - iOS7)

## What It Doesn't Do (feel free to fork and improve!)
- Allow you to login with your Twitter account
- Allow you to edit a tweet you've already queued
- Tweet to multiple accounts
- Store your username and password in a database

## Requirements
- Heroku account
- Twitter account
- Register a Twitter app with the account that you want to tweet with at [http://app.twitter.com](http://app.twitter.com) so you can obtain your API credentials. Make sure you give your app read/write access. You do not need a callback URL.
- Heroku add-ons:
    - [Heroku Postgres](https://addons.heroku.com/heroku-postgresql)
    - [Heroku Scheduler](https://addons.heroku.com/scheduler)

## Notes
When scheduling, use the Heroku Scheduler to run a rake task: `rake sendtweet` at whatever intervals you desire.

## Screenshot
![Screenshot of Twuby by @pibby](http://i.imgur.com/GpLHktd.png)

## Get In Touch
Twitter: [@pibby](http://www.twitter.com/pibby)

### Thank You
- [Sitepoint: Just Do It: Learn Sinatra, Part One](http://www.sitepoint.com/just-do-it-learn-sinatra-i/) (Four part series, comments are very helpful in part 4 for deployment/database setup)
- [Stackoverflow: Sinatra + Heroku + Datamapper deploy issues with dm-sqlite-adapter](http://stackoverflow.com/questions/8912738/sinatra-heroku-datamapper-deploy-issues-with-dm-sqlite-adapter/10112642#10112642)
- [Stackoverflow: What is a very simple authentication scheme for Sinatra/Rack](http://stackoverflow.com/questions/3559824/what-is-a-very-simple-authentication-scheme-for-sinatra-rack/9916897#9916897)
- [Stackoverflow: Twitter Gem for Ruby on Rails not working. What am I missing?](http://stackoverflow.com/questions/20461148/twitter-gem-for-ruby-on-rails-not-working-what-am-i-missing/20461260#20461260)