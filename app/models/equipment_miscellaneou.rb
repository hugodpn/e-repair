# == Schema Information
# Schema version: 20100505020302
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
#  created_at            :datetime
#  updated_at            :datetime
#

class EquipmentMiscellaneou < ActiveRecord::Base
  belongs_to :equipment_type
  belongs_to :equipment_location
  belongs_to :department
  has_many :repairs

  cattr_reader :per_page
  @@per_page = 20
  
end
