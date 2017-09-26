class PuzzleWordSerializer < ActiveModel::Serializer
  attributes :id, :boxId, :alignment, :word
  belongs_to :word
  belongs_to :puzzle
end
