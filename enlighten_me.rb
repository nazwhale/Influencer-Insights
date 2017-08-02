require_relative 'lib/insights'

json_filename = ARGV[0]
channel_insights = Insights.new(json_filename)

line_break = "  /====================================================/"
big_indent = "        "
small_indent = "      "
smaller_indent = "    "

puts line_break
puts smaller_indent + "Influencer Insights for " + channel_insights.get_influencer_name + ":"
puts
puts small_indent + "Video with the highest % likes-to-dislikes:"
puts big_indent + channel_insights.highest_likes_ratio
puts
puts small_indent + "Average likes-to-dislikes:"
puts big_indent + channel_insights.mean_likes_ratio.to_s
puts
puts small_indent + "Total video views:"
puts big_indent + channel_insights.total_views.to_s
puts line_break
