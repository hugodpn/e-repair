# == Schema Information
# Schema version: 20100506011630
#
# Table name: request_repairs
#
#  id            :integer(4)      not null, primary key
#  date          :datetime
#  department_id :integer(4)
#  reason        :string(255)
#  solution      :text
#  repair_id     :integer(4)
#  user_id       :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class RequestRepair < ActiveRecord::Base
  belongs_to :department
  has_one :repair
  belongs_to :user

  validates_presence_of :reason

  cattr_reader :per_page
  @@per_page = 10

  def set_repair repair_id
    self.repair_id = repair_id
    self.save
  end
  
end
