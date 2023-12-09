class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :comments
      t.integer :rating
      t.references :user, null: false, foreign_key: true
       # Agrega esta línea

      t.timestamps
    end
  end
end
