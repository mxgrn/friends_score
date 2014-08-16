class GameLevel < ActiveRecord::Base
  ORDER_VALUES = %i(asc desc)

  belongs_to :game
  has_many :scores, dependent: :destroy

  def full_title
    game.title + " (#{title})"
  end
end
