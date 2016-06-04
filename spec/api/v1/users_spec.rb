require_relative '../api_helper'

describe 'users API' do
  describe 'GET /users/index' do
    let(:request) { get "/api/v1/users", format: :json }
    let(:users) { create_list(:user, 2) }
    let(:user) { users.first }
    let(:skill) { create(:skill) }
    let!(:users_skill) { create(:users_skill, user: user, skill: skill) }
    let!(:experience) { create(:experience) }
    let!(:users_experience) { create(:users_experience, user: user, experience: experience) }
    let!(:education) { create(:education) }
    let!(:users_education) { create(:users_education, user: user, education: education) }

    before { request }

    context 'users' do
      it 'return 200 status' do
        expect(response).to be_success
      end

      it 'return list of users' do
        expect(response.body).to have_json_size(2).at_path('users')
      end

      %w(id name current_title current_position summary level created_at updated_at).each do |field|
        it "user object contains #{field}" do
          expect(response.body).to be_json_eql(user.send(field.to_sym).to_json).at_path("users/0/#{field}")
        end
      end
    end

    context 'skills' do
      it 'included to user object' do
        expect(response.body).to have_json_size(1).at_path('users/0/skills')
      end

      %w(id title created_at updated_at).each do |field|
        it "skill object contains #{field}" do
          expect(response.body).to be_json_eql(skill.send(field.to_sym).to_json).at_path("users/0/skills/0/#{field}")
        end
      end
    end

    context 'experiences' do
      it 'included to user object' do
        expect(response.body).to have_json_size(1).at_path('users/0/experiences')
      end

      %w(id description created_at updated_at).each do |field|
        it "skill object contains #{field}" do
          expect(response.body).to be_json_eql(experience.send(field.to_sym).to_json).at_path("users/0/experiences/0/#{field}")
        end
      end
    end

    context 'educations' do
      it 'included to user object' do
        expect(response.body).to have_json_size(1).at_path('users/0/educations')
      end

      %w(id description created_at updated_at).each do |field|
        it "skill object contains #{field}" do
          expect(response.body).to be_json_eql(education.send(field.to_sym).to_json).at_path("users/0/educations/0/#{field}")
        end
      end
    end
  end

  describe 'POST /create' do
    let(:linked_url) { 'https://www.linkedin.com/in/timo-moss-b48b8a112?trk=hp-identity-name' }
    let(:request) { post "/api/v1/users", linked_url: linked_url, format: :json }

    before {request}

    it 'returns success code 201' do
      expect(response).to be_success
    # end

      # it 'creates a new user in database' do
        expect(User.all.count).to eq 1
      # end

    # it 'return only 1 object' do
      expect(response.body).to have_json_size(1)
    # end

    %w(id name current_title current_position summary created_at updated_at).each do |field|
      # it "return user object contains #{field}" do
        expect(response.body).to be_json_eql(User.first.send(field.to_sym).to_json).at_path("user/#{field}")
      end

      # context 'skills' do
      #   it 'included to user object' do
          expect(response.body).to have_json_size(39).at_path('user/skills')
        # end

        %w(id title created_at updated_at).each do |field|
          # it "skill object contains #{field}" do
            expect(response.body).to be_json_eql(User.first.skills.last.send(field.to_sym).to_json).at_path("user/skills/38/#{field}")
          # end
        end
      # end

      # context 'experiences' do
      #   it 'included to user object' do
          expect(response.body).to have_json_size(3).at_path('user/experiences')
        # end

        %w(id description created_at updated_at).each do |field|
          # it "skill object contains #{field}" do
            expect(response.body).to be_json_eql(User.first.experiences.first.send(field.to_sym).to_json).at_path("user/experiences/0/#{field}")
          # end
        end
      # end

      # context 'educations' do
      #   it 'included to user object' do
          expect(response.body).to have_json_size(2).at_path('user/educations')
        # end

        %w(id description created_at updated_at).each do |field|
          # it "skill object contains #{field}" do
            expect(response.body).to be_json_eql(User.first.educations.last.send(field.to_sym).to_json).at_path("user/educations/0/#{field}")
          # end
        end
      # end
    end
  end
end
