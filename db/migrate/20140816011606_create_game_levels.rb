class CreateGameLevels < ActiveRecord::Migration
  def change
    create_table :game_levels do |t|
      t.string :title
      t.integer :game_id

      t.timestamps
    end
  end
end
