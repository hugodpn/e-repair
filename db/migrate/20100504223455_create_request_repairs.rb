class CreateRequestRepairs < ActiveRecord::Migration
  def self.up
    create_table :request_repairs do |t|
      t.datetime :date
      t.integer :department_id
      t.string :reason
      t.text :solution
      t.integer :repair_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :request_repairs
  end
end
