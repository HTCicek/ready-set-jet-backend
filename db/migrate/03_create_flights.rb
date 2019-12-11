class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.time :flight_time
      t.datetime :arrival_time
      t.datetime :departure_time
      t.references :origin
      t.references :destination
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
