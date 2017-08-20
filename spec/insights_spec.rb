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
      influencer = "YouTuber"
      expect(insights.get_influencer_name).to eq influencer
    end
  end

  describe '#get_video_with_highest_likes_ratio' do
    it 'returns video title with the best ratio' do
      top_video = "Video E"
      expect(insights.get_video_with_highest_likes_ratio).to eq top_video
    end
  end

  describe '#mean_likes_ratio' do
    it 'returns the average percentage of likes to dislikes' do
      mean_likes_ration = "99.5"
      expect(insights.mean_likes_ratio).to eq mean_likes_ration
    end
  end

  describe '#compute_total_views' do
    it 'returns the summed views for all videos' do
      total_views = "49400"
      expect(insights.compute_total_views).to eq total_views
    end
  end

  describe '#compute_mean_time_intervals' do
    xit 'creates array of video release times' do
      expect(insights.get_video_release_times).to eq 


    end
  end

end
