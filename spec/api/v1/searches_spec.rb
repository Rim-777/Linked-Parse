require_relative '../api_helper'

describe 'searches API' do
  describe 'GET /searches/search' do
    let(:request) { get '/api/v1/search/search', query: 'Web', category: 'user', format: :json }
    let!(:users) { create_list(:user, 2, current_title: 'Web developer') }
    let(:user) { users.first }
    let(:other_user) { users.last }
    let(:another_user) { create(:user) }
    let!(:skill_ruby) { create(:skill, title: 'Ruby') }
    let!(:users_skill_ruby) { create(:users_skill, user: user, skill: skill_ruby) }
    let!(:skill_js) { create(:skill, title: 'js') }
    let!(:users_skill_js) { create(:users_skill, user: user, skill: skill_js) }

    before do
      ThinkingSphinx::Test.index
      request
    end

    describe 'user category request' do
      let(:request) { get '/api/v1/search/search', query: 'Web', category: 'user', format: :json }

      context 'users' do
        it 'return 200 status' do
          expect(response).to be_success
        end

        it 'return list of users' do
          expect(response.body).to have_json_size(2).at_path('users')
        end

        %w(id name current_title current_position summary created_at updated_at).each do |field|
          it "user object contains #{field}" do
            expect(response.body).to be_json_eql(user.send(field.to_sym).to_json).at_path("users/0/#{field}")
          end
        end

        %w(id name current_title current_position summary level created_at updated_at).each do |field|
          it "other_user object contains #{field}" do
            expect(response.body).to be_json_eql(other_user.send(field.to_sym).to_json).at_path("users/1/#{field}")
          end
        end
      end

      context 'skills' do
        it 'included to user object' do
          expect(response.body).to have_json_size(2).at_path('users/0/skills')
        end

        %w(id title created_at updated_at).each do |field|
          it "skill object contains #{field}" do
            expect(response.body).to be_json_eql(skill_ruby.send(field.to_sym).to_json).at_path("users/0/skills/0/#{field}")
          end
        end
      end

      context 'experiences' do
        it 'included to user object' do
          expect(response.body).to have_json_size(0).at_path('users/0/experiences')
        end
      end

      context 'educations' do
        it 'included to user object' do
          expect(response.body).to have_json_size(0).at_path('users/0/educations')
        end
      end
    end

    describe 'skill category request' do
      context 'skills' do
        let(:request) { get '/api/v1/search/search', query: 'ruby', category: 'skill', format: :json }

        context 'authorized' do
          it 'return 200 status' do
            expect(response).to be_success
          end

          it 'return list of skills' do
            expect(response.body).to have_json_size(1).at_path('searches')
          end

          context 'users' do
            it 'return list of users' do
              expect(response.body).to have_json_size(1).at_path('searches/0/users')
            end

            %w(id name current_title current_position summary level created_at updated_at).each do |field|
              it "skill object contains #{field}" do
                expect(response.body).to be_json_eql(user.send(field.to_sym).to_json).at_path("searches/0/users/0/#{field}")
              end
            end
          end

          context 'experiences' do
            it 'included to user object' do
              expect(response.body).to have_json_size(0).at_path('searches/0/users/0/experiences')
            end
          end

          context 'educations' do
            it 'included to user object' do
              expect(response.body).to have_json_size(0).at_path('searches/0/users/0/educations')
            end
          end
        end
      end
    end
  end
end
