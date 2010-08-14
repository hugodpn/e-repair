class CreateEquipmentLocations < ActiveRecord::Migration
  def self.up
    create_table :equipment_locations do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_locations
  end
end
