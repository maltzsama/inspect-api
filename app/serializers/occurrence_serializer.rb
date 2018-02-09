class OccurrenceSerializer < ActiveModel::Serializer
  attributes :id, :description, :picture, :user_id, :deadline_id, :problem_id, :severity_id, :inspection_id,:created_at, :updated_at, :solution
end
