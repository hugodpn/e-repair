# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def is_config_menu
    ["departments", "equipment_types", "equipment_locations", "equipment_miscellaneous",
     "reason_faults"].include?(controller.controller_name)
  end

  def is_admin_menu
    ["users", "roles"].include?(controller.controller_name)
  end

  def is_home_menu
    ["main", "request_repairs", "repairs"].include?(controller.controller_name)
  end

  def is_report_menu
    ["reports"].include?(controller.controller_name)
  end

  def is_help_menu
    ["helps"].include?(controller.controller_name)
  end
  
end
