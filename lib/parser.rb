require 'json'

class Parser

  def initialize(videos_json)
    @videos_json = videos_json
  end

  def read_and_parse
    unparsed_json = read_file(@videos_json)
    parse_file(unparsed_json)
  end

  private

  def read_file(videos_json)
    videos_json.read
  end

  def parse_file(unparsed_json)
    parsed_json = JSON.parse(unparsed_json)
    get_videos_arary(parsed_json)
  end

  def get_videos_arary(parsed_json)
    parsed_json["videos"]
  end

end
