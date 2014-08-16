class GameLevel < ActiveRecord::Base
  belongs_to :game
  has_many :scores, dependent: :destroy

  def title
    game.title + " (#{read_attribute(:title)})"
  end
end
