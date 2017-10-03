require_relative 'lib/insights'

videos_json = open(ARGV[0])
channel_insights = Insights.new(videos_json)

line_break = "  /====================================================/"
big_indent = "        "
small_indent = "      "
smaller_indent = "    "

puts line_break
puts smaller_indent + "Influencer Insights for " + channel_insights.influencer_name + ":"
puts
puts small_indent + "Video with the highest % likes-to-dislikes:"
puts big_indent + channel_insights.video_with_highest_likes_ratio
puts
puts small_indent + "Average likes-to-dislikes ratio:"
puts big_indent + channel_insights.mean_likes_ratio + "%"
puts
puts small_indent + "Total video views:"
puts big_indent + channel_insights.compute_total_views
puts
puts small_indent + "Average video release interval:"
puts big_indent + channel_insights.compute_mean_release_interval + " days"
puts line_break
