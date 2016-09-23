json.score_reports do
  json.array! @score_reports do |score_report|
    json.extract! score_report, :id, :inning, :name, :detail, :score, :game_date
  end
end
