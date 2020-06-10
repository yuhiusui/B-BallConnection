class Court < ApplicationRecord
  has_many :favorites
  has_many :comments

  attachment :court_image, destroy: false

  def favorited_by?(player) # いいねしてたら消えるボタン
    favorites.where(player_id: player.id).exists?
  end
end
