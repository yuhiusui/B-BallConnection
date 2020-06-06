class Comment < ApplicationRecord
  belongs_to :player
  belongs_to :court
  validates :comment, presence: true
end
