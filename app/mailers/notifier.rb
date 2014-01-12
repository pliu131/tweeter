class Notifier < ActionMailer::Base
  default from: "admin@example.com"

  def welcome(user)
  	@user = user
  	@signin_url = signin_url
  	mail(to: @user.email, subject: 'Welcome to My Sample App')
  end
end
