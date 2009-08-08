require 'test_helper'

class PointsHelperTest < ActionView::TestCase
  test "good format" do
    output = points 1234.5
    assert_equal output, "1234"
  end
end
