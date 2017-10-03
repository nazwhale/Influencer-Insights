require_relative 'parser'
require 'date'

class Insights

  attr_reader :video_statistics
  TITLE_DIVIDER = " | "

  def initialize(videos_json)
    @video_statistics = parse_file(videos_json)
  end

  def influencer_name
    first_video_title.partition(TITLE_DIVIDER).last
  end

  def video_with_highest_likes_ratio
    names_with_likes_ratio.key(names_with_likes_ratio.values.max)
  end

  def mean_likes_ratio
    mean(ratios_array)
  end

  def total_views
    @video_statistics.inject(0) { |sum, video| sum + video["views"] }
  end

  def mean_release_interval
    ordered_release_times = release_times.sort
    ordered_release_times.map! { |time| convert_to_datetime(time) }
    mean_intervals(ordered_release_times)
  end

  private

  def parse_file(videos_json)
    parser = Parser.new(videos_json)
    parser.read_and_parse
  end

  def mean(array)
    total = array.inject { |sum, item| sum + item }.to_f
    mean = total / array.length
    mean.round(1)
  end

  def likes_ratio(likes, dislikes)
    total = likes + dislikes
    (likes.to_f / total.to_f) * 100
  end

  def names_with_likes_ratio
    titles_to_ratios = {}

    @video_statistics.each do |video|
      ratio = likes_ratio(video["likes"], video["dislikes"])
      video_name = isolate_video_name(video["title"])
      titles_to_ratios[video_name] = ratio
    end

    titles_to_ratios
  end

  def isolate_video_name(title)
    title.partition(TITLE_DIVIDER).first
  end

  def first_video_title
    @video_statistics.first["title"]
  end

  def ratios_array
    names_with_likes_ratio.values
  end

  def release_times
    @video_statistics.map { |video| video["published_at"] }
  end

  def convert_to_datetime(time)
    DateTime.strptime(time, "%Y-%m-%dT%H:%M:%S")
  end

  def mean_intervals(array)
    intervals = intervals(array)
    mean(intervals)
  end

  def intervals(array)
    intervals = []
    array.each_with_index do |element, index|
      intervals << array[index + 1] - array[index] unless element == array.last
    end
    intervals
  end

end
