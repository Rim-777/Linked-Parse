class CreateUsersExperiences < ActiveRecord::Migration
  def change
    create_table :users_experiences do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :experience, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :users_experiences, [:user_id, :experience_id]
  end
end
