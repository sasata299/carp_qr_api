class ScoreReportsController < ApplicationController
  before_action :set_target_date, only: [:date, :update_result]

  def index
    @score_reports = ScoreReport.order('id DESC').limit(10)
  end

  def date
    @score_reports = ScoreReport.active.where(game_date: @date)
    @result = Result.active.find_by(game_date: @date)
  end

  def update
    @score_report = ScoreReport.find(params[:id])
    @score_report.publish!
  end

  def update_result
    @result = Result.find_by(game_date: @date)
    @result.publish!
  end

  private

  def set_target_date
    if params[:date]
      @date = Date.parse(params[:date])
    end
  end
end
