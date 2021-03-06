# == Schema Information
# Schema version: 20100427230408
#
# Table name: permissions
#
#  id               :integer(4)      not null, primary key
#  permissible_id   :integer(4)
#  permissible_type :string(255)
#  action           :string(255)
#  granted          :boolean(1)
#  created_at       :datetime
#  updated_at       :datetime
#

class Permission < ActiveRecord::Base
  # uncomment any of the following lines which is relevant to your application,
  # or create your own with the name of the model which acts_as_permissible.
  #belongs_to :user
  
  belongs_to :role
  
  belongs_to :permissible, :polymorphic => true
  
  validates_presence_of :permissible_id, :permissible_type, :action
  validates_format_of :action, :with => /^[a-z_]+$/
  validates_numericality_of :permissible_id
  validates_uniqueness_of :action, :scope => [:permissible_id,:permissible_type]
  
  def to_hash
    self.new_record? ? {} : {self.action => self.granted}
  end


  #  PERMISSIONS = {
  #    :model => {
  #      :general => {
  #        :title => "Show model general something...",
  #        :columns => ["show", "edit", "create"],
  #        :rows => ["uno", "dos", "tres"]
  #      },
  #      :general_two => {
  #        :title => "Show model general_two something...",
  #        :columns => ["edit", "create"],
  #        :rows => ["uno", "dos", "tres"]
  #      }
  #    }, # "model_general_show_uno"
  #    :model_two => {
  #      :general => {
  #        :title => "Show model_two general something...",
  #        :columns => ["show", "edit", "create"],
  #        :rows => ["uno", "dos", "tres"]
  #      }
  #    }
  #  }


  PERMISSIONS = {
    :equipment_miscellaneous => {
      :equipment_miscellaneous => {
        :title => "Equipment miscellaneous",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "take_out"]
      }
    }, :request_repairs => {
      :request_repairs => {
        :title => "Request Repairs",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy", "repair"]
      }
    }, :repairs => {
      :repairs => {
        :title => "Repairs",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "destroy"]
      }
    }, :reports => {
      :reports => {
        :title => "Reports",
        :columns => ["can"],
        :rows => ["repair_costs", "take_out", "request_repairs", "repairs", "pending_repairs",
          "repairs_by_equipment", "repairs_by_department"]
      }
    }, :departments => {
      :departments => {
        :title => "Department",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :equipment_types => {
      :equipment_types => {
        :title => "Equipment Types",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :equipment_locations => {
      :equipment_locations => {
        :title => "Equipment Locations",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :reason_faults => {
      :reason_faults => {
        :title => "Reason Faults",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :users => {
      :users => {
        :title => "Users",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :roles => {
      :roles => {
        :title => "Roles",
        :columns => ["can"],
        :rows => ["list", "show", "edit", "create", "destroy"]
      }
    }, :tabs => {
      :tabs => {
        :title => "Tabs",
        :columns => ["can"],
        :rows => ["reports", "config", "admin", "help"]
      }
    }
  }

end
