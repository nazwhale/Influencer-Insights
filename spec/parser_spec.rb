require 'parser'

describe Parser do

  test_file = open("zoella_video_stats.json")
  subject(:parser) { described_class.new(test_file) }

  describe '#parse' do
    it 'parses a JSON file on entry' do
      json = test_file.read
      parsed_json = JSON.parse(json)
      expect(parser.parse_file).to eq parsed_json["videos"]
    end
  end

end
