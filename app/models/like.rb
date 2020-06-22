class Like < ApplicationRecord
  belongs_to :court
  belongs_to :player
  attachment :player_image, destroy: false
  attachment :court_image, destroy: false
end
