class UserMailer < ApplicationMailer

  default :from => 'info@recipeper.com'

    def welcome(user)
        @user = user

        @url  = 'http://www.recipeper.com'
        mail(to: @user.email, subject: 'Welcome to Recipeper')
      end

end
