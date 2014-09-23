require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  test "create collection" do
    collection = Collection.new
    assert collection
  end

end
