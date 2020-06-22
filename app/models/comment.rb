class Comment < ApplicationRecord
  belongs_to :court
  belongs_to :player
  attachment :player_image, destroy: false
  attachment :court_image, destroy: false

  validates :comment, presence: true, length: { in: 3..50 }
end
