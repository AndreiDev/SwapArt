module User::AuthDefinitions
  extend ActiveSupport::Concern

  included do

    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable, :omniauthable


    # new function to determine whether a password has been set
    def has_no_password?
      #super
      self.encrypted_password.blank? || self.uid
    end


    # Password not required when using omniauth
    def password_required?
      super
    end


    # Confirmation not required when using omniauth
    def confirmation_required?
      super
    end


    def update_with_password(params, *options)
      if encrypted_password.blank?
        update_attributes(params, *options)
      else
        super
      end
    end


    def from_omniauth(omniauth)
      if omniauth
        self.uid = omniauth.uid

        if omniauth.info
          self.email = omniauth.info.email if omniauth.info.email
          self.name = omniauth.info.name if omniauth.info.name
          self.first_name = omniauth.info.first_name if omniauth.info.first_name
          self.last_name = omniauth.info.last_name if omniauth.info.last_name

          self.nickname = omniauth.info.nickname if omniauth.info.nickname
          self.nickname ||= omniauth.info.username if omniauth.info.username
        end

        if omniauth.extra
          if omniauth.extra.raw_info
            self.birthday = DateTime.strptime(omniauth.extra.raw_info.birthday, "%m/%d/%Y") if omniauth.extra.raw_info.birthday
          end
        end

      end
    end

  end
end