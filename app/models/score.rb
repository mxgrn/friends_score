class Score < ActiveRecord::Base
  belongs_to :game_level
  belongs_to :user
  delegate :game, to: :game_level
end
