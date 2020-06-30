class Court < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_players, through: :likes, source: :player

  attachment :court_image, destroy: false
  attachment :player_image, destroy: false
  geocoded_by :the_address
  after_validation :geocode

# geocoderで緯度経度取得するため
  def the_address
    [prefecture_name, city, street].compact.join(', ')
  end


# 住所登録関連
  include JpPrefecture
  jp_prefecture :prefecture_code
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name)
  end


# いいね確認用
  def liked_by?(player)
    likes.where(player_id: player.id).exists?
  end
  def already_liked?(court)
    self.likes.exists?(court_id: court.id)
  end
end
