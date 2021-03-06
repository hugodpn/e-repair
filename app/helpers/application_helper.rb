# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def is_config_menu
    ["departments", "equipment_types", "equipment_locations", 
     "reason_faults", "configtab"].include?(controller.controller_name)
  end

  def is_admin_menu
    ["users", "roles", "admintab"].include?(controller.controller_name)
  end

  def is_home_menu
    ["equipment_miscellaneous", "main", "request_repairs", "repairs"].include?(controller.controller_name)
  end

  def is_report_menu
    ["reports"].include?(controller.controller_name)
  end

  def is_help_menu
    ["helps"].include?(controller.controller_name)
  end
  
end
