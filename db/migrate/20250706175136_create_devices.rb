class CreateDevices < ActiveRecord::Migration[8.0]
  def change
    create_table :devices do |t|
      t.string :model
      t.string :uuid

      t.timestamps
    end
  end
end
