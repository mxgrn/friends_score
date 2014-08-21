class GameLevel < ActiveRecord::Base
  ORDER_VALUES = {
    asc: "higher is better",
    desc: "lower is better"
  }

  belongs_to :game
  has_many :scores, dependent: :destroy

  def full_title
    game.title + " (#{title})"
  end
end
