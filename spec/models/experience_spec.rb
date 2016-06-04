require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should have_many(:users_experiences).dependent(:destroy) }
  it { should have_many(:users).through(:users_experiences)}
end
