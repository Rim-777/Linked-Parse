require 'rails_helper'

RSpec.describe Education, type: :model do
  it { should have_many(:users_educations).dependent(:destroy) }
  it { should have_many(:users).through(:users_educations)}
end
