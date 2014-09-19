class SwapMailer < ActionMailer::Base
  default from: "\"SwapArt notification\" <notification@swapart.co>"

  def inform(user)
    @user = user
    mail(to: "\"#{@user.first_name} #{@user.last_name}\" <#{@user.email}>" , subject: 'החלפה מוכנה ב-SwapArt.co')
  end
end
