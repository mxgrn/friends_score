# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    value "9.99"
    game_level_id 1
    user_id 1
    ascending ""
  end
end
