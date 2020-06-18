class Comment < ApplicationRecord
  belongs_to :court
  belongs_to :player
  validates :comment, presence: true, length: { in: 3..50 }
end
