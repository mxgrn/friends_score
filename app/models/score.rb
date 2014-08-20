class Score < ActiveRecord::Base
  belongs_to :game_level
  belongs_to :user
  delegate :game, to: :game_level
  delegate :order, to: :game_level

  validates :game_level, presence: true

  def new_best?
    next_better.nil? && !last_best.nil?
  end

  def last_best
    @last_best ||= begin
      scope = if order == "asc"
                game_level.scores.where("value < ?", value).order(value: :desc)
              else
                game_level.scores.where("value > ?", value).order(:value)
              end

      scope.limit(1).first
    end
  end

  def next_better
    @next_better ||= begin
      scope = if order == "asc"
                game_level.scores.where("value > ?", value).order(:value)
              else
                game_level.scores.where("value < ?", value).order(value: :desc)
              end

      scope.limit(1).first
    end
  end
end
