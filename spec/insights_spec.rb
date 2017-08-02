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

  describe '#get_influencer_name' do
    it 'returns the name of the YouTube influencer' do
      INFLUENCER = "Zoella"
      expect(insights.get_influencer_name).to eq INFLUENCER
    end
  end

  describe '#highest_likes_ratio' do
    it 'returns video title with the best ratio' do
      TOP_VIDEO = "Most Likely To : Tanya Edition"
      expect(insights.highest_likes_ratio).to eq TOP_VIDEO
    end
  end

  describe '#mean_likes_ratio' do
    it 'returns the average percentage of likes to dislikes' do
      MEAN_LIKES_RATIO = 99.003
      expect(insights.mean_likes_ratio.round(3)).to eq MEAN_LIKES_RATIO
    end
  end

  describe '#total_views' do
    it 'returns the summed views for all videos' do
      TOTAL_VIEWS = 14125776
      expect(insights.total_views).to eq TOTAL_VIEWS
    end
  end

end
