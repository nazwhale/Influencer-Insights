require 'insights'

describe Insights do

  test_file = "zoella_video_stats.json"

  subject(:insights) { described_class.new(test_file) }

  describe '#get_influencer_name' do
    it 'returns the name of the YouTube influencer' do
      INFLUENCER = "Zoella"
      expect(insights.get_influencer_name).to eq INFLUENCER
    end
  end

  describe '#highest_likes_ratio' do
    it 'returns video title with the best ratio' do
      TOP_VIDEO = "Most Likely To : Tanya Edition"
      expect(insights.get_video_with_highest_likes_ratio).to eq TOP_VIDEO
    end
  end

  describe '#mean_likes_ratio' do
    it 'returns the average percentage of likes to dislikes' do
      MEAN_LIKES_RATIO = "99.0"
      expect(insights.mean_likes_ratio).to eq MEAN_LIKES_RATIO
    end
  end

  describe '#total_views' do
    it 'returns the summed views for all videos' do
      TOTAL_VIEWS = "14125776"
      expect(insights.compute_total_views).to eq TOTAL_VIEWS
    end
  end

end
