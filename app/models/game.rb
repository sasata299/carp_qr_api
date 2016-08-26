class Game
  attr_reader :doc, :date, :score_reports, :score

  def initialize(doc)
    @doc = doc
    @date = Date.parse(date_str)
    @score_reports = generate_score_reports
    @score = generate_score unless ongoing?
  end

  private

  def date_str
    doc.css('.bord-card').inner_text.split[0]
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

  def generate_score
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
