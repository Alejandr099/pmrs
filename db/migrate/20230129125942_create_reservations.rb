class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations, force: true do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :property, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
