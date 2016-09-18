FactoryGirl.define do
  factory :score_report do
    inning "1回表"
    name "田中"
    detail "3塁線をやぶるタイムリーヒット"
    score "2-0"
    game_date Date.today
    published_at nil
  end
end
