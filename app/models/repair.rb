# == Schema Information
# Schema version: 20100506011630
#
# Table name: repairs
#
#  id                        :integer(4)      not null, primary key
#  equipment_miscellaneou_id :integer(4)
#  location                  :string(255)
#  date_in                   :date
#  fault_reported            :text
#  reason_fault_id           :integer(4)
#  fix                       :text
#  date_out                  :date
#  cost                      :float           default(0.0)
#  outsource_cost            :float           default(0.0)
#  observations              :text
#  request_repair_id         :integer(4)
#  user_id                   :integer(4)
#  created_at                :datetime
#  updated_at                :datetime
#

class Repair < ActiveRecord::Base
  belongs_to :equipment_miscellaneou
  belongs_to :reason_fault
  belongs_to :request_repair
  belongs_to :user

  cattr_reader :per_page
  @@per_page = 10
  
end
