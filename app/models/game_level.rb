class GameLevel < ActiveRecord::Base
  belongs_to :game
  has_many :scores, dependent: :destroy

  def full_title
    game.title + " (#{read_attribute(:title)})"
  end
end
