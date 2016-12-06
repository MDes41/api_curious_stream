class UsersController < ApplicationController
	def index
		client = Stream::Client.new(ENV['STREAM_API_KEY'], ENV['STREAM_API_SECRET'])
		# For the feed group 'user' and user id 'eric' get the feed
		current_user_feed = client.feed('user', current_user.username)
		# Add the activity to the feed
		current_user.tweets.each do |tweet|
			activity_data = {:actor => current_user.username, :verb => 'tweet', :object => tweet.id }
			activity_response = current_user_feed.add_activity(activity_data)
		end

		feed = StreamRails.feed_manager.get_user_feed(current_user.username)
    @tweets = feed.get()['results'].map do |feed|
    	Tweet.find(feed['object'])
    end

    # byebug
    # @activities = @enricher.enrich_activities(results)
	end
end