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

  def get_states(items)
    users_that_want_my_items = User.find_by_sql ["SELECT DISTINCT users.*
    FROM users
    LEFT JOIN wants on users.id = wants.user_id
    LEFT JOIN items on wants.item_id = items.id
    WHERE users.is_active = 1 AND users.is_blocked = 0
    AND items.user_id = '?'", current_user.id]

    states = {}
    items.each { |item|
      user_wants_item = item.want_users.include? current_user
      item_owner_wants_users_item = users_that_want_my_items.include? item.user
      case [user_wants_item, item_owner_wants_users_item]
        when [false, false]
          states[item.id] = 1
        when [true, false]
          states[item.id] = 2
        when [false, true]
          states[item.id] = 3
        when [true, true]
          states[item.id] = 4
      end
    }
    return states
  end

  private

  def check_registration
    #if current_user && !current_user.valid?
    #  flash[:warning] = "Please finish your #{view_context.link_to "registration", edit_user_registration_url }  before continuing.".html_safe
    #end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :first_name, :last_name, :roles => []) }
  end
end
