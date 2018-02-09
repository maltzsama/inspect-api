class InspectionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description,:place_id, :created_at, :updated_at
end
