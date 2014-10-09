class SwapMailer < ActionMailer::Base
  default from: "\"SwapArt notification\" <notification@swapart.co>"

  def inform(user)
    @user = user
    if Rails.env != 'production'
      mail(to: "andrei.averkin@gmail.com" , subject: "\"#{@user.first_name} #{@user.last_name}\" <#{@user.email}>" + '---' + 'החלפה מוכנה ב-SwapArt.co')
    else
      mail(to: "\"#{@user.first_name} #{@user.last_name}\" <#{@user.email}>" , subject: 'החלפה מוכנה ב-SwapArt.co')
    end
  end
end
