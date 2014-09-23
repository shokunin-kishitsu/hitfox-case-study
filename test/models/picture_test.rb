require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  test "create picture" do
    picture = Picture.new
    assert picture
  end

end
