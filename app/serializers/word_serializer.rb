class WordSerializer < ActiveModel::Serializer
  attributes :id, :answer, :question, :value
end
