class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :current_title,
             :current_position,
             :summary,
             :level,
             :created_at,
             :updated_at

  # has_many :skills
  has_many :experiences
  has_many :educations
end
