require 'insights'

describe Insights do

  test_file = open("zoella_video_stats.json")
  json = file.read
  parsed_json = JSON.parse(json)

  subject(:insights) { described_class.new(test_file) }

  describe '#initialize' do
    it 'parses a JSON file on entry' do
      expect(insights.video_statistics).to eq parsed_json
    end
  end

end
