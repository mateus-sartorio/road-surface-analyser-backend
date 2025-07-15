class AddRecordIdToUserAccelerometer < ActiveRecord::Migration[8.0]
  def change
    add_reference :user_accelerometers, :record, null: false, foreign_key: true
  end
end
