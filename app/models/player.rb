class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :player_images, destroy: false

  has_many :follower, class_name: "Relation", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relation", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end


  # 会員ステータスがtrueでないとログインできない
  def active_for_authentication?
    super && (self.is_valid == true)
  end

  # 会員一覧をIDの古い順番で表示
  default_scope -> { order(created_at: :desc) }
end
