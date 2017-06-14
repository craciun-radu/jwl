class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def current_language
    return I18n.locale.to_s
  end
end
