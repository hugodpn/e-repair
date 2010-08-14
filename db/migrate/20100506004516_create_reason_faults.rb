class CreateReasonFaults < ActiveRecord::Migration
  def self.up
    create_table :reason_faults do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :reason_faults
  end
end
