class UserImportService
  attr_reader :person, :data, :linked_url

  def initialize(url)
    @linked_url = url
    parse_data!
    create_person!
    add_relations!
  end

  private
  def parse_data!
    @data = Nokogiri::HTML::Document.parse(import_data)
  end

  def import_data
    RestClient.get(linked_url)
  end

  def create_person!
    @person = User.find_or_create_by(
        name: (name.content if name),
        current_title: (current_title.content if current_title),
        current_position: (current_position.content if current_position),
        summary: (summary.content if summary)
    )
  end

  def add_relations!
    add_skills(skills) unless skills.empty?
    add_experiences(experiences) unless experiences.empty?
    add_educations(educations) unless educations.empty?
  end

  def add_skills(skills)
    skills.each do |skill|
      person.skills.find_or_create_by(title: skill.content)
    end
  end

  def add_educations(educations)
    educations.each do |education|
      person.educations.find_or_create_by(description: education.content)
    end
  end

  def add_experiences(experiences)
    experiences.each do |experience|
      person.experiences.find_or_create_by(description: experience.content)
    end
  end

  def name
    data.search('h1.fn').first
  end

  def current_title
    data.search('p.headline').first
  end

  def current_position
    data.search('span.org').first
  end

  def summary
    data.search('div.description').first
  end

  def skills
    skills = data.search('li.skill')
    %w(li.see-more li.see-less).each do |skill|
      skill = data.search(skill).first
      skills.delete(skill) if skill
    end
    skills
  end

  def experiences
    data.search('li.position')
  end

  def educations
    data.search('li.school')
  end
end
