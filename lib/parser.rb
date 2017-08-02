require 'json'

class Parser

  def initialize(json_filename)
    @unparsed_json = open_file(json_filename)
  end

  def parse_file
    parsed_json = JSON.parse(@unparsed_json)
    parsed_json["videos"]
  end

  private

  def open_file(json_filename)
    file = open(json_filename)
    file.read
  end

end
