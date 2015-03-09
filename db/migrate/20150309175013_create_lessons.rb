class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.integer :chapter_id

      t.timestamps null: false
    end
  end
end
