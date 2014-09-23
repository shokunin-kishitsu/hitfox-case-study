require 'test_helper'

class MonumentTest < ActiveSupport::TestCase

  test "create monument" do
    monument = Monument.new
    assert monument
  end
end
