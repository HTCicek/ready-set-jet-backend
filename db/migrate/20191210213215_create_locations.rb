class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.decimal :latitude
      t.decimal :longitude
      t.integer :altitude
      t.decimal :timezone
      t.string :dst
      t.string :tz_olson
      t.string :data_type
      t.string :source_type

      t.timestamps
    end
  end
end
