class AddRecordIdToLocation < ActiveRecord::Migration[8.0]
  def change
    add_reference :locations, :record, null: false, foreign_key: true
  end
end
