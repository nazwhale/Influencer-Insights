class Insights

  attr_reader :video_statistics

  def initialize(json_filename)
    file = open(json_filename)
    json = file.read
    @video_statistics = JSON.parse(json)
  end

  def compute_likes_ratio(likes, dislikes)
    (dislikes.to_f / likes.to_f) * 10000
  end

end
