require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:users_skills).dependent(:destroy) }
  it { should have_many(:skills).through(:users_skills)}
  it { should have_many(:users_experiences).dependent(:destroy) }
  it { should have_many(:experiences).through(:users_experiences)}
  it { should have_many(:users_educations).dependent(:destroy) }
  it { should have_many(:educations).through(:users_educations)}
end
