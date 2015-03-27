class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.integer :teacher_type
      t.integer :student_type

      t.timestamps null: false
    end
  end
end
