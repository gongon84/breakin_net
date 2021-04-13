class UserMailer < ApplicationMailer

  default from: ENV['GMAIL_USERNAME']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  # 登録確認メール
  def activation_needed_email(user)
    @user = user
    # @url = "http://localhost:3000/users/#{user.activation_token}/activate"
    @url = "https://breakin-net.herokuapp.com/users/#{user.activation_token}/activate"
    mail(:to => user.email,
      :subject => "【Breakin Net】登録のご確認")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  # 登録完了メール
  def activation_success_email(user)
    @user = user
    @url = "http://localhost:3000/login"
    mail(:to => user.email,
    :subject => "【Breakin Net】登録完了のお知らせ")
  end
end
