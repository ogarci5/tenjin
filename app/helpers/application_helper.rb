module ApplicationHelper
  def theme_class
    theme = 'blank' if current_user && current_user.name == '空白' && current_user.theme.nil?
    current_user ? current_user.theme || theme : ''
  end
end
