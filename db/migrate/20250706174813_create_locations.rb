class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.float :altitude
      t.float :accuracy
      t.float :bearing
      t.float :speed
      t.datetime :timestamp
      t.float :speedAccuracy
      t.float :bearingAccuracyDegrees
      t.float :verticalAccuracyMeters

      t.timestamps
    end
  end
end
