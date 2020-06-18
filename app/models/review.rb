class Review < ApplicationRecord
  belongs_to :court
  belongs_to :player

  validates :rv_title, presence: true, length: { in: 3..10 }
  validates :rv_body, presence: true, length: { in: 3..50 }
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
