class CreateUsersEducations < ActiveRecord::Migration
  def change
    create_table :users_educations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :education, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :users_educations, [:user_id, :education_id]
  end
end
