require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "unfunded should be draft" do
    p = projects(:one)
    p.status = "live"
    p.save
    assert_equal "draft", p.status
  end
  
  test "fully funded should have a funded status" do
    p = projects(:one)
    p.save
    
    p.bounty.pledges << pledges(:full)
    p.save
    
    assert_equal "funded", p.status
  end
  
  test "banned project should stay banned" do
    p = projects(:one)
    p.status = "banned"
    p.save
    assert_equal "banned", p.status
  end
  
  test "raw category string" do
    p = projects(:one)
    p.category_names = "a, b, c, d, ,e"
    assert_equal 5, p.categories.length
    assert_equal "a, b, c, d, e", p.category_names
  end
end
