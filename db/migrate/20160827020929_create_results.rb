class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :detail,    null: false
      t.date   :game_date, null: false

      t.timestamps
    end
  end
end
