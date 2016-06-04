class Education < ActiveRecord::Base
  has_many :users_educations, dependent: :destroy
  has_many :users, through: :users_educations
end
