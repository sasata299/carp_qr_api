class Game
  attr_reader :date, :point_chart

  def initialize(doc)
    @date = Date.parse(doc.css('.bord-card').inner_text.split[0])
    @point_chart = doc.css('table.toku-waku:not([style="display:none"])')
  end
end
