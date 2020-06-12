class Comment < ApplicationRecord
  belongs_to :court
  belongs_to :player
  validates :comment, presence: true
end
