class AddTravelIdToRecord < ActiveRecord::Migration[8.0]
  def change
    add_reference :records, :travel, null: false, foreign_key: true
  end
end
