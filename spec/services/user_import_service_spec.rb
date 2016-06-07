require 'rails_helper'

describe 'user import service' do
  describe '#initialize' do
    let(:linked_url) {'https://www.linkedin.com/in/timo-moss-b48b8a112?trk=hp-identity-name'}
    let(:import) {UserImportService.new(linked_url)}

    it 'return user' do
      expect(import.person.class).to eq User
    end

    it 'add in database user' do
      import
      expect(User.first.name).to eq 'Timo Moss'
      expect(User.first.current_title).to eq ' Web developer – Avirbo SOFT '
      expect(User.first.current_position).to eq 'Avirbo SOFT'
      expect(User.first.summary.truncate(16)).to eq 'Web Developer...'
    end

    it 'add in database skills' do
      import
      expect(Skill.first.title).to eq 'Ruby'
      expect(Skill.last.title).to eq 'UML'
    end

    it 'add in database experiences' do
      import
      expect(Experience.first.description.truncate(17)).to eq ' Ruby on Rails...'
      expect(Experience.last.description.truncate(12)).to eq ' Engineer...'
    end

    it 'add in database educations' do
      import
      expect(Education.first.description.truncate(11)).to eq ' Донской...'
      expect(Education.last.description.truncate(11)).to eq ' Tel-Ran  '
    end
  end
end
