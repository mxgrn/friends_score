class VisitorsController < ApplicationController
  def index
    @best_scores = build_best_scores
    @scores = Score.order(created_at: :desc)
  end

  def build_best_scores
    Game.all.inject({}) do |r,g|
      levels = g.game_levels.map do |l|
        l.scores.order(value: l.order.to_sym).last
      end.compact

      levels.empty? ? r : r.merge(g.title => levels)
    end
  end
end
