class Puzzle < ApplicationRecord
  has_many :grid_boxes
  has_many :puzzle_words
  has_many :words, through: :puzzle_words
end
