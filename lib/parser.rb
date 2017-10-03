require 'json'

class Parser

  def initialize(videos_json)
    @videos_json = videos_json
  end

  def read_and_parse
    unparsed_json = read_file(@videos_json)
    parsed_json = parse_file(unparsed_json)
    videos_array(parsed_json) if appropriate_json?(parsed_json)
  end

  private

  def appropriate_json?(parsed_json)
    message = "Please enter a json file with influencer data"
    parsed_json["videos"].each { |video| fail message unless correct_keys?(video) }
  end

  def correct_keys?(video)
    video.key?("title") &&
    video.key?("views") &&
    video.key?("published_at") &&
    video.key?("likes") &&
    video.key?("dislikes")
  end

  def read_file(videos_json)
    videos_json.read
  end

  def parse_file(unparsed_json)
    JSON.parse(unparsed_json)
    rescue JSON::ParserError
      fail "Please enter a valid json file"
  end

  def videos_array(parsed_json)
    parsed_json["videos"]
  end

end
