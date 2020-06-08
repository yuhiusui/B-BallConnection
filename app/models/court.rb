class Court < ApplicationRecord
  has_many :favorites
  has_many :comments

  def favorited_by?(player) # いいねしてたら消えるボタン
    favorites.where(player_id: player.id).exists?
  end
end
