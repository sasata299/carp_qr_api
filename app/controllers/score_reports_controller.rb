class ScoreReportsController < ApplicationController
  def index
    date = Date.yesterday

    @score_reports = ScoreReport.active.where(game_date: date)
    @result = Result.active.find_by(game_date: date)
  end
end
