class CreateTravels < ActiveRecord::Migration[8.0]
  def change
    create_table :travels do |t|
      t.timestamps
      t.datetime :timestamp_begin
      t.datetime :timestamp_end
    end
  end
end
