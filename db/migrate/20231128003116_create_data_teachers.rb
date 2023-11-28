class CreateDataTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :data_teachers do |t|
      t.string :certification
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
