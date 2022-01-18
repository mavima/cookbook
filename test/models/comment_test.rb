require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "user can write a comment" do
    user = User.create(email: "test@mail.com", first_name: "test", last_name: "tester")
    recipe = Recipe.create(name: "test recipe", description: "testing", user_id: user.id)
    comment = Comment.new(user_id: user.id,
                  recipe_id: recipe.id,
                  content: "testing comment",
    )
    assert_equal "testing comment", comment.content
  end
end
