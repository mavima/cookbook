class UserMailer < ApplicationMailer

  default :from => 'info@recipeper.com'

    def welcome(user)
        @user = user

        # change url!
        @url  = 'http://www.gmail.com'
        mail(to: @user.email, subject: 'Welcome to Recipeper')
      end

end
