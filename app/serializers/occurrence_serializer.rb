class OccurrenceSerializer < ActiveModel::Serializer
  attributes :id, :description, :picture, :deadline_id, :problem_id, :severity_id, :inspection_id,:created_at, :updated_at, :solution
end
