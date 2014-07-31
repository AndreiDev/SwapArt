class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    omniauth = auth_hash

    identity = Identity.where(provider: omniauth['provider'], uid: omniauth['uid']).first
    user = identity.user if identity

    if user.nil?
      identity = Identity.from_omniauth(omniauth)

      if identity.email.nil? || identity.nickname.nil?
        session[:omniauth] = omniauth.except('extra')
        session[:omniauth_provider] = omniauth.provider
        redirect_to new_user_registration_url
      else
        current_user = User.find_by_email(identity.email)
        user = identity.find_or_create_user(current_user)
      end
    end

    unless user.nil?
      if user.valid?
        flash.notice = "Signed in!"
        sign_in_and_redirect user
      else
        sign_in user
        redirect_to edit_user_registration_url
      end
    end

  end

  alias_method :facebook, :all
  #alias_method :twitter, :all
  #alias_method :github, :all
  #alias_method :google_oauth2, :all
  #alias_method :linkedin, :all
  #alias_method :kerberos, :all

  def after_sign_in_path_for(resource)
    if resource.phone.present?
      super resource
    else
      finish_signup_path(resource)
    end
  end

  protected

  def auth_hash
    #raise request.env["omniauth.auth"].to_yaml
    request.env['omniauth.auth']
  end

  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end

end