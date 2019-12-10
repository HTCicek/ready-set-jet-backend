class CreateArrivals < ActiveRecord::Migration[6.0]
  def change
    create_table :arrivals do |t|
      t.datetime :arrive_at
      t.references :flight, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
