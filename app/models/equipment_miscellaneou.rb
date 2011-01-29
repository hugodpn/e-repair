# == Schema Information
# Schema version: 20100506011630
#
# Table name: equipment_miscellaneous
#
#  id                    :integer(4)      not null, primary key
#  equipment_type_id     :integer(4)
#  brand                 :string(255)
#  model                 :string(255)
#  serial_number         :string(255)
#  inventory_number      :integer(4)
#  equipment_location_id :integer(4)
#  department_id         :integer(4)
#  cost                  :float
#  observations          :text
#  take_out_reason       :text
#  take_out_user_id      :integer(4)      default(-1)
#  created_at            :datetime
#  updated_at            :datetime
#

class EquipmentMiscellaneou < ActiveRecord::Base

  named_scope :take_out, :conditions => ["take_out_user_id > 0"]
  named_scope :take_in, :conditions => ["take_out_user_id = -1"]

  belongs_to :equipment_type
  belongs_to :equipment_location
  belongs_to :department
  has_many :repairs
  belongs_to :user, :class_name => "User", :foreign_key => "take_out_user_id"

  validates_presence_of :brand
  validates_presence_of :inventory_number
  validates_presence_of :equipment_type_id
  validates_presence_of :equipment_location_id
  validates_presence_of :department_id
  validates_numericality_of :inventory_number

  cattr_reader :per_page
  @@per_page = 20
  
end
