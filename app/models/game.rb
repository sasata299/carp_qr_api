class Game
  attr_reader :doc, :date, :teams, :score_reports, :result

  def initialize(doc)
    @doc = doc
    @date = Date.parse(date_str)
    @teams = generate_teams
    @score_reports = generate_score_reports
    @result = generate_result unless ongoing?
  end

  private

  def date_str
    doc.css('.bord-card').inner_text.split[0]
  end

  def generate_teams
    teams = []

    doc.css('table.score tr').each do |tr|
      gr = GameResult.new(tr.inner_text.split)
      teams << gr.team_name unless gr.team_name.empty?
    end

    teams
  end

  def generate_score_reports
    score_reports = []

    point_chart = doc.css('table.toku-waku:not([style="display:none"])')
    point_chart.css('tr').each do |tr|
      # data: [when, name, detail, score]
      score_report = tr.css('td:not([class="toku-li"])').map { |td| td.inner_text.gsub(/\s/, '') }
      next if score_report.empty?

      score_reports << score_report
    end

    score_reports
  end

  def generate_result
    scores = []

    doc.css('table.score tr').each do |tr|
      gr = GameResult.new(tr.inner_text.split)

      scores << [
        gr.team_name.ljust(5, '　'),
        gr.scores.join(' '),
        gr.hit_num.ljust(2),
        gr.error_num
      ].join(' ')
    end

    scores.join("\n")
  end

  def ongoing?
    doc.css('table.pitcher').empty?
  end
end
