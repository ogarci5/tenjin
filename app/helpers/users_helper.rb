module UsersHelper
  def dd(string)
    string.blank? ? 'None' : string
  end

  def themes
    themes = ['Default', 'Inaba', 'Chitoge', '']
    themes.delete_if{|theme| theme.blank?} unless current_user.name == '空白'
    p themes
    themes
  end
end
