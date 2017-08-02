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

  describe '#highest_likes_ratio' do
    it 'returns video title with the best ratio' do
      expect(insights.highest_likes_ratio).to eq "Most Likely To : Tanya Edition | Zoella"
    end
  end

  describe '#mean_likes_ratio' do
    it 'returns the average percentage of likes to dislikes' do
      
    end
  end

end
