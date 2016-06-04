require 'rails_helper'

RSpec.describe UsersEducation, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:education) }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :education_id }
end
