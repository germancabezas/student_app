class CreateLessonElements < ActiveRecord::Migration
  def change
    create_table :lesson_elements do |t|
      t.string :element_type
      t.text :text
      t.string :url
      t.integer :priority
      t.integer :chapter_id
      t.integer :lesson_id

      t.timestamps null: false
    end
  end
end
