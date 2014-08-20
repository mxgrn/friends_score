# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game_level do
    title "MyString"
    order "asc"
    game_id 1
  end
end
