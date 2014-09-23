require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "create category" do
    category = Category.new
    assert category
  end

end
