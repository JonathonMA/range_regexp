require 'test_helper'

require 'range_regexp'

# :nodoc:
class RangeRegexpTest < MiniTest::Test
  MATCHES = {
    1..3 => {
      match: %w[
        1
        2
        3
        41
        425
      ],
      nomatch: %w[
        4
        5
        6
      ],
    },
    11..13 => {
      match: %w[
        11
        12
        13
        113
      ],
      nomatch: %w[
        14
        31
        21
        214
        151
      ],
    }
  }

  MATCHES.each do |range, classes|
    classes[:match].each do |str|
      define_method "test_#{range}_should_match_#{str}" do
        rr = RangeRegexp.new range
        assert rr.regexp.match str
      end
    end

    classes[:nomatch].each do |str|
      define_method "test_#{range}_should_match_#{str}" do
        rr = RangeRegexp.new range
        refute rr.regexp.match str
      end
    end
  end

  def test_knows_the_size
    rr = RangeRegexp.new 11..13

    assert_equal 2, rr.size
  end
end
