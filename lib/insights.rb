class Insights

  attr_reader :video_statistics

  def initialize(json_filename)
    file = open(json_filename)
    json = file.read
    @video_statistics = JSON.parse(json)
  end

end
