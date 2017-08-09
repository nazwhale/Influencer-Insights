require 'parser'

describe Parser do

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
        "likes" => 5000,
        "dislikes" => 87
      },
      {"title" => "Video B | YouTuber",
       "views" => 200,
       "likes" => 77500,
       "dislikes" => 35
      }
    ]
  end

  subject(:parser) { described_class.new(StringIO.new(videos_json)) }


  describe '#open_and_parse' do

    context 'valid json' do
      it 'outputs a parsed JSON file' do
        expect(parser.read_and_parse).to eq parsed_json
      end
    end

    context 'invalid json' do
      it 'returns an error message if given invalid json' do
        @additional_videos = '[[] "tite": "Negative video", "views": -100 }'
        message = "Please enter a valid json file"
        expect{parser.read_and_parse}.to raise_error message
      end

      # I get valid JSON but which is unrelated

    end
  end

end
