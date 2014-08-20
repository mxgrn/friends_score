# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    value "9.99"
    association :game_level
    user_id 1
  end
end
