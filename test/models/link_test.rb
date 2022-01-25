require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "user can add a link" do
    user = User.create(email: "test@mail.com", first_name: "test", last_name: "tester")
    link = Link.create(user_id: user.id, url: "www.test.com")
    assert_equal "www.test.com", link.url
  end
end
