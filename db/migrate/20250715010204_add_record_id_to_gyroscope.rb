class AddRecordIdToGyroscope < ActiveRecord::Migration[8.0]
  def change
    add_reference :gyroscopes, :record, null: false, foreign_key: true
  end
end
