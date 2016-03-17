require "./lib/app.rb"
require "test/unit"

class TestApp < Test::Unit::TestCase

  def test_sample
    assert_equal(4, 2 + 2)
  end

end
