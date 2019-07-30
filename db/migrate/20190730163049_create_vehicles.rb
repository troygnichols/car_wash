class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string  :license_plate, null: false
      t.string  :type,          null: false
      t.boolean :bed_muddy
      t.boolean :bed_down
      t.timestamps
    end

    add_index :vehicles, :license_plate, unique: true
  end
end
