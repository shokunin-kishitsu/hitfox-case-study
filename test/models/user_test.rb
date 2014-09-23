require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "create user" do
    user = User.new
    assert user
  end

end
