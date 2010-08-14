# == Schema Information
# Schema version: 20100505020302
#
# Table name: equipment_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class EquipmentType < ActiveRecord::Base
  has_many :equpment_miscellaneous
end
