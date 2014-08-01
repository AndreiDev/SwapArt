class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :check_registration
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_save(new_registry_path, registry)
    if params[:redirection] == t("model.buttons.saveAndAddAnother") && !new_registry_path.nil?
      redirect_to new_registry_path
    else
      respond_with(registry)
    end
  end

=begin
  # for use with:
  # before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
  def ensure_signup_complete(current_user)
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # phone is missing
    if current_user && !current_user.phone.present?
      redirect_to finish_signup_path(current_user)
    end
=end

  private

  def check_registration
    if current_user && !current_user.valid?
      flash[:warning] = "Please finish your #{view_context.link_to "registration", edit_user_registration_url }  before continuing.".html_safe
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :first_name, :last_name, :roles => []) }
  end
end
