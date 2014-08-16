class VisitorsController < ApplicationController
  def index
    @best_scores = build_best_scores
    @scores = Score.order(created_at: :desc)
  end

  def build_best_scores
    GameLevel.all.map do |l|
      l.scores.order(value: l.order.to_sym).last
    end.compact
  end
end
