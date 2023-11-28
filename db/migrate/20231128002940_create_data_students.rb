class CreateDataStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :data_students do |t|
      t.string :grade_coursed
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
