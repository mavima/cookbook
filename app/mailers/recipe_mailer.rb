class RecipeMailer < ApplicationMailer

    def send_recipe(user, recipe)
        @user = user
        @recipe = recipe
        @subject = 'Recipeper: ' + @recipe.name
        headers['recipe'] = {"id": @recipe.id}
        mail(to: user.email, subject: @subject )
    end
end
