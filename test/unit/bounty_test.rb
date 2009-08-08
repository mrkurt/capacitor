require 'test_helper'

class BountyTest < ActiveSupport::TestCase
  test "remaining in bounty" do
    b = Bounty.new(:amount => 1000)
    b.pledges << Pledge.new(:amount => 100)
    assert_equal 100, b.raised
    assert_equal 10, b.raised(:format => :percent)
    assert_equal 900, b.remaining
    assert_equal 90, b.remaining(:format => :percent)
    assert_equal 0, b.remaining(:target_percent => 10)
  end
end
