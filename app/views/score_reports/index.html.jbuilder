json.score_reports do
  json.array! @score_reports do |score_report|
    json.extract! score_report, :inning, :name, :detail, :score
  end
end

json.result @result.detail
