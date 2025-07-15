class AddDeviceIdToTravel < ActiveRecord::Migration[8.0]
  def change
    add_reference :travels, :device, null: false, foreign_key: true
  end
end
