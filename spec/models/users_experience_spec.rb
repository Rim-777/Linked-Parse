require 'rails_helper'

RSpec.describe UsersExperience, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:experience) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :experience_id }
end
