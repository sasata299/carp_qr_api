class Tasks::FetchScore
  require 'capybara/poltergeist'

  @doc = nil

  class << self
    def execute
      setup

      game = Game.new(@doc)

      game.score_reports.each do |score_report|
        prompt_report = PromptReport.find_or_initialize_by(
          when: score_report[0],
          name: score_report[1],
          score: score_report[3],
          game_date: game.date
        )
        prompt_report.detail = score_report[2]
        prompt_report.save!
      end
    end

    private

    def setup
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 5000)
      end

      session = Capybara::Session.new(:poltergeist)
      session.driver.headers = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2564.97 Safari/537.36'
      }
      session.visit 'http://score.rcc.jp/'

      @doc = Nokogiri::HTML.parse(session.html)
    end
  end
end
