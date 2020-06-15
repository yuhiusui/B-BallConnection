class Review < ApplicationRecord
  belongs_to :court
  belongs_to :player

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
