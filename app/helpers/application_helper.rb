module ApplicationHelper
  def theme_class
  	theme = current_user.try(:theme)
    theme = 'blank' if current_user && current_user.name == '空白' && current_user.theme.blank?
    theme
  end
end
