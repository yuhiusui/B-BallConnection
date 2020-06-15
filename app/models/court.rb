class Court < ApplicationRecord
  has_many :comments
  has_many :reviews
  has_many :likes
  has_many :liked_players, through: :likes, source: :player

  attachment :court_image, destroy: false

  def liked_by?(player) # いいねしてたら消えるボタン
    likes.where(player_id: player.id).exists?
  end
  def already_liked?(court)
    self.likes.exists?(court_id: court.id)
  end
end
