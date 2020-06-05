class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # 会員ステータスがtrueでないとログインできない
  def active_for_authentication?
    super && (self.is_valid == true)
  end

  # 会員一覧をIDの古い順番で表示
  default_scope -> { order(created_at: :desc) }
end
