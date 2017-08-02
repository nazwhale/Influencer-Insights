require 'insights'

describe Insights do

  test_file = open("zoella_video_stats.json")

  subject(:insights) { described_class.new(test_file) }

  describe '#initialize' do
    it 'parses a JSON file on entry' do
      json = test_file.read
      parsed_json = JSON.parse(json)
      expect(insights.video_statistics).to eq parsed_json["videos"]
    end
  end

  describe '#compute_likes' do
    it 'returns title of video with the best like ratio' do
      expect(insights.highest_like_ratio).to eq "Most Likely To : Tanya Edition | Zoella"
    end
  end

end
