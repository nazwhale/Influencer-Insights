require 'json'

class Parser

  def initialize(videos_json)
    @videos_json = videos_json
  end

  def read_and_parse
    unparsed_json = read_file(@videos_json)
    parsed_json = parse_file(unparsed_json)
    get_videos_arary(parsed_json)
  end

  private

  def read_file(videos_json)
    videos_json.read
  end

  def parse_file(unparsed_json)
    JSON.parse(unparsed_json)
    rescue JSON::ParserError
      fail "Please enter a valid json file"
  end

  def get_videos_arary(parsed_json)
    parsed_json["videos"]
  end

end
