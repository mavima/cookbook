require 'test_helper'

class FavouriteTest < ActiveSupport::TestCase
  test "user can add a favourite" do
    user = User.create(email: "test@mail.com", first_name: "test", last_name: "tester")
    recipe = Recipe.create(name: "test recipe", description: "testing", user_id: user.id)
    favourite = Favourite.create(user_id: user.id, recipe_id: recipe.id)
    assert_equal 1, Favourite.count
  end
end
