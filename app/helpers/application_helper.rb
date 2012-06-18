module ApplicationHelper
  def iconed_text(name, icon, color = 'white')
    "<i class='#{icon} icon-#{color}'></i> #{name}".html_safe
  end
end
