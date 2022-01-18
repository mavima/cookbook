require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "user can write a review" do
    user = User.create(email: "test@mail.com", first_name: "test", last_name: "tester")
    recipe = Recipe.create(name: "test recipe", description: "testing", user_id: user.id)
    review = Review.new(user_id: user.id,
                  recipe_id: recipe.id,
                  content: "testing review",
                  rating: 4
    )
    assert_equal 4, review.rating
  end
end
