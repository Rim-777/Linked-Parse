class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :description,
             :created_at,
             :updated_at
end
