require 'json'

class Parser

  def self.open_and_parse(json_filename)
    unparsed_json = self.open_file(json_filename)
    parse_file(unparsed_json)
  end

  private

  def self.open_file(json_filename)
    file = open(json_filename)
    file.read
  end

  def self.parse_file(unparsed_json)
    parsed_json = JSON.parse(unparsed_json)
    get_videos_arary(parsed_json)
  end

  def self.get_videos_arary(parsed_json)
    parsed_json["videos"]
  end

end
