class UserMailer < ApplicationMailer
  default from: 'angelvazquezvirgen@gmail.com'
  def confirm_email(user)
    @user = user
    mail to: user.email, subject: 'Confirma tu correo electronico'
  end
end
