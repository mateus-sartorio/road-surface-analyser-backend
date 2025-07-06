class CreateGyroscopes < ActiveRecord::Migration[8.0]
  def change
    create_table :gyroscopes do |t|
      t.float :x
      t.float :y
      t.float :z

      t.timestamps
    end
  end
end
