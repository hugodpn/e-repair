# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def selected_header_link selected
    "class=\"activelink\"" if selected.include?(controller.controller_name)
  end
end
