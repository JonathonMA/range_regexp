require 'range_regexp/splitter'

# Makes a regexp that matches a Range
class RangeRegexp
  def initialize(range)
    @range = range
  end

  def regexp
    /#{static_prefix_re}#{variable_range_re}/
  end

  def size
    splitter.static_prefix.size + splitter.subrange.first.to_s.size
  end

  private

  def splitter
    Splitter.new(@range)
  end

  def static_prefix_re
    Regexp.escape splitter.static_prefix
  end

  def variable_range_re
    if splitter.subrange
      Regexp.union splitter.subrange.map(&:to_s)
    else
      ""
    end
  end
end
