json.array!(@scores) do |score|
  json.extract! score, :id, :value, :game_level_id, :user_id, :ascending
  json.url score_url(score, format: :json)
end
