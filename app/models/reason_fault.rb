# == Schema Information
# Schema version: 20100506011630
#
# Table name: reason_faults
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ReasonFault < ActiveRecord::Base
  has_many :repairs
end
