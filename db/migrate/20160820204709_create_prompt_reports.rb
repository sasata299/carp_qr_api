class CreatePromptReports < ActiveRecord::Migration[5.0]
  def change
    create_table :prompt_reports do |t|
      t.string :when,      null: false
      t.string :name,      null: false
      t.string :detail,    null: false
      t.string :score,     null: false
      t.date   :game_date, null: false

      t.timestamps
    end
  end
end
