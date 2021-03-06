class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    omniauth = auth_hash

    identity = Identity.where(provider: omniauth['provider'], uid: omniauth['uid']).first
    user = identity.user if identity

    if user.nil?
      identity = Identity.from_omniauth(omniauth)

      if !User.find_by_email(identity.email).present? || !User.find_by_email(identity.email).phone
        session[:omniauth] = omniauth.except('extra')
        session[:omniauth_provider] = omniauth.provider
        flash.notice = t('devise.registrations.add_phone')
        redirect_to new_user_registration_url
      else
        current_user = User.find_by_email(identity.email)
        user = identity.find_or_create_user(current_user)
      end
    end

    unless user.nil?
      if user.valid?
        flash.notice = t('devise.sessions.signed_in')
        sign_in_and_redirect user
      else
        sign_in user
        redirect_to edit_user_registration_url
      end
    end

  end

  alias_method :facebook, :all

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