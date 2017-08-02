class Insights

  attr_reader :video_statistics

  def initialize(json_filename)
    file = open(json_filename)
    json = file.read
    parsed_json = JSON.parse(json)
    @video_statistics = parsed_json["videos"]
  end

  def compute_likes_ratio(likes, dislikes)
    total = likes + dislikes
    (likes.to_f / total.to_f) * 100
  end

  def highest_like_ratio

    titles_to_ratios = {}

    @video_statistics.each do |video|
      ratio = compute_likes_ratio(video["likes"], video["dislikes"])
      titles_to_ratios[video["title"]] = ratio
    end

    titles_to_ratios.key(titles_to_ratios.values.max)
  end

end
