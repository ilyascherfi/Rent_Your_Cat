class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.boolean :statut
      t.date :start_date
      t.date :end_date
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :cats, null: false, foreign_key: true

      t.timestamps
    end
  end
end
