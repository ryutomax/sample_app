class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    @greeting = "Hi"   # 必要なら残す

    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
