class Court < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_players, through: :likes, source: :player, dependent: :destroy

  attachment :court_image, destroy: false


  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name)
  end



  def liked_by?(player) # いいねしてたら消えるボタン
    likes.where(player_id: player.id).exists?
  end
  def already_liked?(court)
    self.likes.exists?(court_id: court.id)
  end
end
