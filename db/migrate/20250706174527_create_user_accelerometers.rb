class CreateUserAccelerometers < ActiveRecord::Migration[8.0]
  def change
    create_table :user_accelerometers do |t|
      t.float :x
      t.float :y
      t.float :z

      t.timestamps
    end
  end
end
