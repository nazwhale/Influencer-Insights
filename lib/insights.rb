require_relative 'parser'
require 'date'

class Insights

  attr_reader :video_statistics
  TITLE_DIVIDER = " | "

  def initialize(videos_json)
    @video_statistics = parse_file(videos_json)
  end

  def get_influencer_name
    get_first_video_title.partition(TITLE_DIVIDER).last
  end

  def get_video_with_highest_likes_ratio
    get_names_with_likes_ratio.key(get_names_with_likes_ratio.values.max)
  end

  def mean_likes_ratio
    ratios = get_ratios_array
    calculate_mean(ratios)
  end

  def compute_total_views
    sum = 0
    @video_statistics.each { |video| sum += video["views"] }
    sum.to_s
  end

  def compute_mean_release_interval
    ordered_release_times = get_release_times.sort
    ordered_release_times.map! { |time| convert_to_datetime(time) }
    get_mean_intervals(ordered_release_times)
  end

  private

  def parse_file(videos_json)
    parser = Parser.new(videos_json)
    parser.read_and_parse
  end

  def calculate_mean(array)
    total = array.inject { |sum, item| sum + item }.to_f
    mean = total / array.length
    mean.round(1).to_s
  end

  def compute_likes_ratio(likes, dislikes)
    total = likes + dislikes
    (likes.to_f / total.to_f) * 100
  end

  def get_names_with_likes_ratio
    titles_to_ratios = {}

    @video_statistics.each do |video|
      ratio = compute_likes_ratio(video["likes"], video["dislikes"])
      video_name = isolate_video_name(video["title"])
      titles_to_ratios[video_name] = ratio
    end

    titles_to_ratios
  end

  def isolate_video_name(title)
    title.partition(TITLE_DIVIDER).first
  end

  def get_first_video_title
    @video_statistics[0]["title"]
  end

  def get_ratios_array
    get_names_with_likes_ratio.values
  end

  def get_release_times
    release_times = []
    @video_statistics.each { |video| release_times << video["published_at"] }
    release_times
  end

  def convert_to_datetime(time)
    DateTime.strptime(time, "%Y-%m-%dT%H:%M:%S")
  end

  def get_mean_intervals(array)
    intervals = get_intervals(array)
    calculate_mean(intervals)
  end

  def get_intervals(array)
    intervals = []
    array.each_with_index do |element, index|
      unless element == array[-1]
        interval = array[index + 1] - array[index]
        intervals << interval
      end
    end
    intervals
  end

end
