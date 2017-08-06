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
    it 'outputs a parsed JSON file' do
      expect(parser.read_and_parse).to eq parsed_json
    end
  end

end
