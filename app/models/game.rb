class Game < ActiveRecord::Base
  has_many :game_levels, dependent: :destroy
end
