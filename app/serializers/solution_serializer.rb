class SolutionSerializer < ActiveModel::Serializer
  attributes :id, :description, :picture, :created_at, :updated_at, :occurrence
end
