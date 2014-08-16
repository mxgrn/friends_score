class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.decimal :value
      t.integer :game_level_id
      t.integer :user_id

      t.timestamps
    end
  end
end
