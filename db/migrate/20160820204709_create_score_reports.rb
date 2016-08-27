class CreateScoreReports < ActiveRecord::Migration[5.0]
  def change
    create_table :score_reports do |t|
      t.string :inning,    null: false
      t.string :name,      null: false
      t.string :detail,    null: false
      t.string :score,     null: false
      t.date   :game_date, null: false

      t.boolean :tweet_flag, default: false

      t.timestamps
    end
  end
end
