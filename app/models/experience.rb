class Experience < ActiveRecord::Base
  has_many :users_experiences, dependent: :destroy
  has_many :users, through: :users_experiences
end
