class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :costumer_id
end
