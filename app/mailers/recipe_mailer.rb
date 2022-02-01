class RecipeMailer < ApplicationMailer

    def send_recipe(user, recipe)
        @user = user
        @recipe = recipe
        headers['recipe'] = {"id": @recipe.id}
        mail(to: user.email, subject: 'Recipe from Recipeper')
    end
end
