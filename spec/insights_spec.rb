require 'insights'

describe Insights do

  let(:videos_json) do
    %Q{
      {
        "videos": [
          { "title": "Video A | YouTuber",
            "views": 15000,
            "likes": 5000,
            "dislikes": 87
          },
          { "title": "Video B | YouTuber",
            "views": 200,
            "likes": 77500,
            "dislikes": 35
          },
          { "title": "Video C | YouTuber",
            "views": 5000,
            "likes": 100000,
            "dislikes": 35
          },
          { "title": "Video D | YouTuber",
            "views": 29000,
            "likes": 7000,
            "dislikes": 50
          },
          { "title": "Video E | YouTuber",
            "views": 200,
            "likes": 850000,
            "dislikes": 70
          }
        ]
      }
    }
  end

  subject(:insights) { described_class.new(StringIO.new(videos_json)) }

  describe '#get_influencer_name' do
    it 'returns the name of the YouTube influencer' do
      INFLUENCER = "YouTuber"
      expect(insights.get_influencer_name).to eq INFLUENCER
    end
  end

  describe '#get_video_with_highest_likes_ratio' do
    it 'returns video title with the best ratio' do
      TOP_VIDEO = "Video E"
      expect(insights.get_video_with_highest_likes_ratio).to eq TOP_VIDEO
    end
  end

  describe '#mean_likes_ratio' do
    it 'returns the average percentage of likes to dislikes' do
      MEAN_LIKES_RATIO = "99.5"
      expect(insights.mean_likes_ratio).to eq MEAN_LIKES_RATIO
    end
  end

  describe '#compute_total_views' do
    it 'returns the summed views for all videos' do
      TOTAL_VIEWS = "49400"
      expect(insights.compute_total_views).to eq TOTAL_VIEWS
    end
  end

end
