class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
