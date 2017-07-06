module ApplicationHelper
  
  # Method used in views
  # Checks if we have an user logged in and if the user is an owner
  def is_owner?
    current_user.present? && current_user.owner?
  end
  
  # Method used in views
  # Checks if we have an user logged in and if the user is a regular user
  def is_regular?
    current_user.present? && current_user.regular?
  end

  def account_target_class
    current_user.present? ? "edit-account-popover" : "sign-in-popover"
  end
  
  def favourites_target_class
    "favourites-popover"
  end

  def carts_target_class
    "carts-popover"
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def translate(attr)
    return "" if attr.blank?
    return I18n.t(attr)
  end
  
  def current_language
    return I18n.locale.to_s
  end
end
