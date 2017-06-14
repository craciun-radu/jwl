class RegistrationsController < Devise::RegistrationsController

  def update
    @notice = {}
    if resource.update_attributes(account_update_params)
      @notice["type"] = "success"
      @notice["message"] = translate("user.success_update")
      sign_in resource_name, resource, :bypass => true
    else
      clean_up_passwords(resource)
      @notice["type"] = "error"
      @notice["message"] = translate("user.failure_update")
    end
    respond_to do |format|
      format.js{ }
      format.html{ render nothing: true}
    end
  end
    
  protected
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    
end