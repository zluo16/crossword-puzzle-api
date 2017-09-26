class PuzzleWord < ApplicationRecord
  belongs_to :word
  belongs_to :puzzle
end
