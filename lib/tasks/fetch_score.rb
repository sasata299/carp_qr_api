class Tasks::FetchScore
  require 'capybara/poltergeist'

  class << self
    def execute
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 5000)
      end

      session = Capybara::Session.new(:poltergeist)

      session.driver.headers = {
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2564.97 Safari/537.36'
      }
      session.visit 'http://score.rcc.jp/'
      doc = Nokogiri::HTML.parse(session.html)

      # 得点経過の要素を持ってくる
      score_doc = doc.css('table.toku-waku:not([style="display:none"])')

      score_doc.css('tr').each do |tr|
        # data: [when, name, detail, score]
        data = tr.css('td:not([class="toku-li"])').map { |td| td.inner_text.gsub(/\s/, '') }
        next if data.empty?

        prompt_report = PromptReport.find_or_initialize_by(
          when: data[0],
          name: data[1],
          score: data[3],
          game_date: Date.today
        )
        prompt_report.detail = data[2]
        prompt_report.save!
      end
    end
  end
end
