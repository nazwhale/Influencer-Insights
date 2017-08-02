require_relative 'lib/insights'

json_filename = ARGV[0]
puts json_filename
channel_insights = Insights.new(json_filename)

puts "Video with highest like ratio: " + channel_insights.highest_likes_ratio
puts "========"
puts "Mean like ratio: " + channel_insights.mean_likes_ratio.to_s
puts "========"
puts "Total video views: " + channel_insights.total_views.to_s
puts "========"
