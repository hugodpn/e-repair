class CreateEquipmentMiscellaneous < ActiveRecord::Migration
  def self.up
    create_table :equipment_miscellaneous do |t|
      t.integer :equipment_type_id
      t.string :brand
      t.string :model
      t.string :serial_number
      t.integer :inventory_number
      t.integer :equipment_location_id
      t.integer :department_id
      t.float :cost
      t.text :observations
      t.text :take_out_reason, :default => nil
      t.integer :take_out_user_id, :default => -1

      t.timestamps
    end
  end

  def self.down
    drop_table :equipment_miscellaneous
  end
end
