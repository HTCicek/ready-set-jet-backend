class CreateDepartures < ActiveRecord::Migration[6.0]
  def change
    create_table :departures do |t|
      t.datetime :depart_at
      t.references :flight, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
