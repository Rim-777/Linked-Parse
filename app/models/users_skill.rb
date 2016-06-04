class UsersSkill < ActiveRecord::Base
  validates :user_id, :skill_id, presence: true
  belongs_to :user
  belongs_to :skill

  after_create :increase_level

  private
  def increase_level
    self.delay.add_points
  end

  def add_points
    ActiveRecord::Base.transaction do
      raise ActiveRecord::Rollback unless user.update(level: score_points)
    end
  end

  def score_points
    user.level + 10
  end
end
