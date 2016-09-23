require 'rails_helper'

describe 'ScoreReport' do
  describe "GET /score_reports/#{Date.today}" do
    context '試合前' do
      it '空のscore_reportsが返ってくる' do
        is_expected.to be 200
        expect(response.body).to be_json_as(
          {
            "score_reports" => [],
            "result" => nil,
            "game_date" => /^\d{4}\-\d{2}\-\d{2}$/
          }
        )
      end
    end

    context '試合途中' do
      before do
        create(:score_report)
      end

      it '途中経過を伝えるscore_reportsが返ってくる' do
        is_expected.to be 200
        expect(response.body).to be_json_as(
          {
            "score_reports" => [
              {
                "id"     => Integer,
                "inning" => String,
                "name"   => String,
                "detail" => String,
                "score"  => String
              },
            ],
            "result" => nil,
            "game_date" => /^\d{4}\-\d{2}\-\d{2}$/
          }
        )
      end
    end

    context '試合終了' do
      before do
        create(:score_report)
        create(:result)
      end

      it 'score_reportsに加えてresultも返ってくる', autodoc: true do
        is_expected.to be 200
        expect(response.body).to be_json_as(
          {
            "score_reports" => [
              {
                "id"     => Integer,
                "inning" => String,
                "name"   => String,
                "detail" => String,
                "score"  => String
              },
            ],
            "result" => String,
            "game_date" => /^\d{4}\-\d{2}\-\d{2}$/
          }
        )
      end
    end
  end
end
