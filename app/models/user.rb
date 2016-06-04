class User < ActiveRecord::Base
  has_many :users_skills, dependent: :destroy
  has_many :skills, through: :users_skills
  has_many :users_experiences, dependent: :destroy
  has_many :experiences, through: :users_experiences
  has_many :users_educations, dependent: :destroy
  has_many :educations, through: :users_educations
end
