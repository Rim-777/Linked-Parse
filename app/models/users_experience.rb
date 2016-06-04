class UsersExperience < ActiveRecord::Base
  validates :user_id, :experience_id, presence: true
  belongs_to :user
  belongs_to :experience
end
