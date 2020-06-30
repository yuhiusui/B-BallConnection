require 'rails_helper'

RSpec.describe Player, type: :model do
  context "データが正しく保存される" do
    before do
      @player = Player.new
      @player.id = "1"
      @player.name = "テストユーザー"
      @player.email = "test@test.com"
      @player.save
    end
    it "全て入力してあるので保存される" do
      expect(@player).to be_valid
    end
  end
  context "データが正しく保存される" do
    before do
      @player = Player.new
      @player.id = "1"
      @player.name = ""
      @player.email = "test@test.com"
      @player.save
    end
    it "nameが入力されていないので保存されない" do
      expect(@player).to be_invalid
      expect(@player.errors[:name]).to include("can't be blank")
    end
  end
end
