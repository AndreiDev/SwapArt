class SwapMailer < ActionMailer::Base
  default from: "noreply@swapart.co"

  def inform(user)
    @user = user
    mail(to: @user.email, subject: 'החלפה מוכנה ב-SwapArt.co')
  end
end
