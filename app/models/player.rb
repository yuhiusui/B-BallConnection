class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :player_image, destroy: false

  validates :name, presence: true, length: { in: 3..10 }
  validates :intro, length: {maximum: 30}

  has_many :comments
  has_many :reviews
  has_many :likes
  has_many :liked_courts, through: :likes, source: :court
  has_many :following, class_name: "Relation", foreign_key: "following_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_player, through: :following, source: :followed # 自分がフォローしている人
  has_many :follower_player, through: :followed, source: :following # 自分をフォローしている人

# 住所登録関連
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

# フォロー関連
  def follow(player_id)
    following.create(followed_id: player_id)
  end
  # ユーザーのフォローを外す
  def unfollow(player_id)
    following.find_by(followed_id: player_id).destroy
  end
  # フォローしていればtrueを返す
  def following?(player)
    following_player.include?(player)
  end

# 会員ステータスがtrueでないとログインできない
  def active_for_authentication?
    super && (self.is_valid == true)
  end

# 会員一覧をIDの古い順番で表示
  default_scope -> { order(created_at: :desc) }

  enum history:{
    a: 0,
    b: 1,
    c: 2,
    d: 3,
    e: 4
  }

  enum position:{
    PG: 0,
    SG: 1,
    SF: 2,
    PF: 3,
    C: 4
  }
end
