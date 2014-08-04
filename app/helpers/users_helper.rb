module UsersHelper
  def dd(string)
    string.blank? ? 'None' : string
  end

  def themes
    themes = User::THEMES
    themes.delete_if{|theme| theme.blank?} unless current_user.name == '空白'
    themes
  end
end
