class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.integer :age
      t.string :race
      t.string :sexe
      t.string :location
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
