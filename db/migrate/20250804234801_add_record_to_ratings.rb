class AddRecordToRatings < ActiveRecord::Migration[8.0]
  def change
    add_reference :ratings, :record, null: true, foreign_key: true
  end
end
