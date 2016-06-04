class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, index: true
      t.string :current_title, index: true
      t.string :current_position, index: true
      t.text :summary
      t.integer :level, default: 1
      t.timestamps null: false
    end
    add_index :users, [:name, :current_title]
  end
end
