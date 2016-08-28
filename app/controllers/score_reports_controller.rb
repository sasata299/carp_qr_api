class ScoreReportsController < ApplicationController
  before_action :set_target_date

  def index
    @score_reports = ScoreReport.active.where(game_date: @date)
    @result = Result.active.find_by(game_date: @date)
  end

  private

  def set_target_date
    @date = Date.yesterday
  end
end
