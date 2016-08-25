class GameResult
  attr_reader :team_name, :scores, :hit_num, :error_num

  def initialize(result)
    @team_name = result[0].gsub('T.N', '')
    @scores = result[1..-3]
    @hit_num = result[-2]
    @error_num = result[-1]
  end
end
