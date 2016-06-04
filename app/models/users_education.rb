class UsersEducation < ActiveRecord::Base
  validates :user_id, :education_id, presence: true
  belongs_to :user
  belongs_to :education
end
