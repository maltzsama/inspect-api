class OccurrenceSerializer < ActiveModel::Serializer
  attributes :id, :description, :picture, :created_at, :updated_at
end
