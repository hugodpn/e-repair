# == Schema Information
# Schema version: 20100505020302
#
# Table name: equipment_locations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EquipmentLocation < ActiveRecord::Base
  has_many :equpment_miscellaneous
end
