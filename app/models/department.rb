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
  has_many :request_repairs, :dependent => :destroy
  has_many :equipment_miscellaneous, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :alias
  validates_uniqueness_of :name
  validates_uniqueness_of :alias

end
