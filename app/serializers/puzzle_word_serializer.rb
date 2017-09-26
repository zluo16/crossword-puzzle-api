class PuzzleWordSerializer < ActiveModel::Serializer
  attributes :id
  has_one :word
  has_one :puzzle
end
