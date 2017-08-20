require 'insights'

describe Insights do

  let(:videos_json) do
    %Q{
      {
        "videos": [
          { "title": "Video A | YouTuber",
            "views": 15000,
            "published_at": "2016-10-30T19:10:37.000Z",
            "likes": 5000,
            "dislikes": 87
          },
          { "title": "Video B | YouTuber",
            "views": 200,
            "published_at": "2016-08-31T18:00:04.000Z",
            "likes": 77500,
            "dislikes": 35
          },
          { "title": "Video C | YouTuber",
            "views": 5000,
            "published_at": "2016-10-19T15:00:10.000Z",
            "likes": 100000,
            "dislikes": 35
          },
          { "title": "Video D | YouTuber",
            "views": 29000,
            "published_at": "2016-10-16T17:00:00.000Z",
            "likes": 7000,
            "dislikes": 50
          },
          { "title": "Video E | YouTuber",
            "views": 200,
            "published_at": "2016-10-23T18:01:52.000Z",
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
      mean_likes_ratio = "99.5"
      expect(insights.mean_likes_ratio).to eq mean_likes_ratio
    end
  end

  describe '#compute_total_views' do
    it 'returns the summed views for all videos' do
      total_views = "49400"
      expect(insights.compute_total_views).to eq total_views
    end
  end

  describe '#compute_mean_release_interval' do
    it 'finds the mean interval between influencers videos' do
      video_release_times = "49752758250.0"
      expect(insights.compute_mean_release_interval).to eq video_release_times
    end
  end

end
