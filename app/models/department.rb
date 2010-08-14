# == Schema Information
# Schema version: 20100505020302
#
# Table name: departments
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  alias      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base
  has_many :request_repairs
  has_many :equipment_miscellaneous
end
