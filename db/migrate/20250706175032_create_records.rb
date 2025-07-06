class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.datetime :timestamp_begin
      t.datetime :timestamp_end

      t.timestamps
    end
  end
end
