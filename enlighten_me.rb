require_relative 'lib/insights'

videos_json = open(ARGV[0])
channel_insights = Insights.new(videos_json)

line_break = "  /====================================================/"
big_indent = "        "
small_indent = "      "
smaller_indent = "    "

puts line_break
puts smaller_indent + "Influencer Insights for #{channel_insights.influencer_name}:\n\n"
puts small_indent + "Video with the highest % likes-to-dislikes:\n#{big_indent}#{channel_insights.video_with_highest_likes_ratio}\n\n"
puts small_indent + "Average likes-to-dislikes ratio:\n#{big_indent}#{channel_insights.mean_likes_ratio}%\n\n"
puts small_indent + "Total video views:\n#{big_indent}#{channel_insights.total_views}\n\n"
puts small_indent + "Average video release interval:\n#{big_indent}#{channel_insights.mean_release_interval} days\n"
puts line_break
