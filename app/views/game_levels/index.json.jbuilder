json.array!(@game_levels) do |game_level|
  json.extract! game_level, :id, :title, :game_id
  json.url game_level_url(game_level, format: :json)
end
