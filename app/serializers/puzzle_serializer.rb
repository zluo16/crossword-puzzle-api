class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :times_played, :rating
  has_many :grid_boxes
  has_many :puzzle_words
end
