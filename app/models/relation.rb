class Relation < ApplicationRecord
  belongs_to :follower, class_name: "Player"
  belongs_to :followed, class_name: "Player"
end
