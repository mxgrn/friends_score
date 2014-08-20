require 'rails_helper'

RSpec.describe Score, :type => :model do
  context "last best" do
    it "returns nil when there's no scores" do
      expect(FactoryGirl.create(:score).last_best).to eql nil
    end

    it "returns nil when best score was from the same user" do
      user = FactoryGirl.create(:user)
      game_level = FactoryGirl.create(:game_level)
      last_score = FactoryGirl.create(:score, user: user)
      score = FactoryGirl.create(:score, user: user)
      expect(score.last_best).to eql nil
    end

    it "returns previous best score for ascending scores" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      game_level = FactoryGirl.create(:game_level)
      last_record = FactoryGirl.create(:score, user: user1, value: 1.0, game_level: game_level)
      new_record = FactoryGirl.create(:score, user: user2, value: 2.0, game_level: game_level)

      expect(new_record.last_best).to eql(last_record)
    end

    it "returns previous best score for descending scores" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      game_level = FactoryGirl.create(:game_level, order: "desc")
      last_record = FactoryGirl.create(:score, user: user1, value: 2.0, game_level: game_level)
      new_record = FactoryGirl.create(:score, user: user2, value: 1.0, game_level: game_level)

      expect(new_record.last_best).to eql(last_record)
    end
  end
end
