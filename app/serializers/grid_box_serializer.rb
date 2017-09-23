class GridBoxSerializer < ActiveModel::Serializer
  attributes :id, :boxId, :type, :key, :value
end
