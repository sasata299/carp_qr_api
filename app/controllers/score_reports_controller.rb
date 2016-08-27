class ScoreReportsController < ApplicationController
  def index
    @score_reports = ScoreReport.all
    render json: @score_reports
  end
end
