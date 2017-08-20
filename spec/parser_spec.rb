require 'parser'

describe Parser do

  let(:videos_json) do
    %Q{
      {
        "videos": [
          { "title": "Video A | YouTuber",
            "views": 15000,
            "published_at": "2016-09-11T19:21:39.000Z",
            "likes": 5000,
            "dislikes": 87
          },
          { "title": "Video B | YouTuber",
            "views": 200,
            "published_at": "2016-08-31T18:00:04.000Z",
            "likes": 77500,
            "dislikes": 35
          }
          #@additional_videos
        ]
      }
    }
  end

  let(:parsed_json) do
    [
      {"title" => "Video A | YouTuber",
        "views" => 15000,
       "published_at"=> "2016-09-11T19:21:39.000Z",
        "likes" => 5000,
        "dislikes" => 87
      },
      {"title" => "Video B | YouTuber",
       "views" => 200,
       "published_at"=> "2016-08-31T18:00:04.000Z",
       "likes" => 77500,
       "dislikes" => 35
      }
    ]
  end

  subject(:parser) { described_class.new(StringIO.new(videos_json)) }

  describe '#open_and_parse' do

    context 'correct json' do
      it 'outputs a parsed JSON file' do
        expect(parser.read_and_parse).to eq parsed_json
      end
    end

    context 'incorrect json' do
      it 'returns an error message if given invalid json' do
        @additional_videos = '[[] "title": "Negative video", "views": -100 }'
        message = "Please enter a valid json file"
        expect{parser.read_and_parse}.to raise_error message
      end

      # I get valid JSON but which is unrelated
      it 'returns an error message if given unrelated json' do
        @additional_videos = ', {"cheeseName": "Stinking bishop", "cheesiness": 10, "creaminess": 6, "pong": 11 }'
        message = "Please enter a json file with influencer data"
        expect{parser.read_and_parse}.to raise_error message
      end

    end
  end

end
