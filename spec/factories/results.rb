FactoryGirl.define do
  factory :result do
    detail "勝ったよ〜"
    game_date Date.today
    published_at nil
  end
end
