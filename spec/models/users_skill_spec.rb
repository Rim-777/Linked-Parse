require 'rails_helper'

RSpec.describe UsersSkill, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:skill) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :skill_id }
end
