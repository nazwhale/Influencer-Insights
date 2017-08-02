require 'insights'

describe Insights do

  test_file = open("zoella_video_stats.json")

  subject(:insights) { described_class.new(test_file) }

  describe '#initialize' do
    it 'parses a JSON file on entry' do
      json = test_file.read
      parsed_json = JSON.parse(json)
      expect(insights.video_statistics).to eq parsed_json
    end
  end

  describe '#compute_likes_ratio' do
    it 'outputs correct percentage' do
      likes = insights.video_statistics["videos"][0]["likes"]
      dislikes = insights.video_statistics["videos"][0]["dislikes"]
      expect(insights.compute_likes_ratio(likes, dislikes)).to be_within(0.01).of(97.6)
    end
  end

end
