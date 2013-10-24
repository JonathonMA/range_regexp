require 'test_helper'

require 'range_regexp/splitter'

# :nodoc:
class RangeRegexp::SplitterTest < MiniTest::Test
  def test_static_prefix
    rr = RangeRegexp::Splitter.new 11..13
    assert_equal "1", rr.static_prefix
  end

  def test_static_prefix_short
    rr = RangeRegexp::Splitter.new 1..3
    assert_equal "", rr.static_prefix
  end

  def test_subrange
    rr = RangeRegexp::Splitter.new 11..13
    assert_equal 1..3, rr.subrange
  end

  def test_subrange_simple
    rr = RangeRegexp::Splitter.new 1..3
    assert_equal 1..3, rr.subrange
  end

  def test_string_prefix
    rr = RangeRegexp::Splitter.new "foobar".."foobaz"

    assert_equal "fooba", rr.static_prefix
  end

  def test_string_subrange
    rr = RangeRegexp::Splitter.new "foobar".."foobaz"

    assert_equal "r".."z", rr.subrange
  end
end
