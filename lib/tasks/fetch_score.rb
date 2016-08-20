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
        tr.css('td:not([class="toku-li"])').each do |td|
          puts td.inner_text
        end
      end
    end
  end
end
