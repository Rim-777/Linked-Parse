require 'rails_helper'

describe 'search service' do
  describe '#initialize' do
    let(:query) { 'Ruby' }
    let(:user_category) { 'user' }
    let(:skill_category) { 'skill' }

    it 'should  receive search for User class' do
      expect(User).to receive(:search)
      SearchService.new(query, user_category)
    end

    it 'should  receive search for Skill class' do
      expect(Skill).to receive(:search)
      SearchService.new(query, skill_category)
    end

    it 'should  receive search for ThinkingSphinx class' do
      expect(ThinkingSphinx).to receive(:search)
      SearchService.new(query, nil)
    end
  end
end
