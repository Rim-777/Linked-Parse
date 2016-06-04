class CreateUsersSkills < ActiveRecord::Migration
  def change
    create_table :users_skills do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :skill, index: true, foreign_key: true
      t.timestamps null: false
      end
    add_index :users_skills, [:user_id, :skill_id]
  end
end
