class ScoreReportsController < ApplicationController
  before_action :set_target_date

  def index
    @score_reports = ScoreReport.active.where(game_date: @date)
    @result = Result.active.find_by(game_date: @date)
  end

  def update
    @score_report = ScoreReport.find(params[:id])
    @score_report.publish!
  end

  def update_result
    @result = Result.find_by(game_date: params[:game_date])
    @result.publish!
  end

  private

  def set_target_date
    #@date = Date.yesterday
    @date = Date.today
  end
end
