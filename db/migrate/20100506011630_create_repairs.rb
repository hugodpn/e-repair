class CreateRepairs < ActiveRecord::Migration
  def self.up
    create_table :repairs do |t|
      t.integer :equipment_miscellaneou_id
      t.string :location
      t.date :date_in
      t.text :fault_reported
      t.integer :reason_fault_id
      t.text :fix
      t.date :date_out
      t.float :cost
      t.float :outsource_cost
      t.text :observations
      t.integer :request_repair_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :repairs
  end
end
