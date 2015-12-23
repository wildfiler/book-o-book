module ApplicationHelper
  def active_if_on(controller)
    'active' if current_page?(controller: controller)
  end
end
