require 'parser'

describe Parser do

  test_file = "zoella_video_stats.json"
  opened_file = open(test_file)
  unparsed_json = opened_file.read
  parsed_json = JSON.parse(unparsed_json)
  array_of_videos = parsed_json["videos"]

  describe '#open_and_parse' do
    it 'outputs a parsed JSON file' do
      expect(Parser.open_and_parse(test_file)).to eq array_of_videos
    end
  end

end
