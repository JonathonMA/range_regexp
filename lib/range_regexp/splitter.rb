class RangeRegexp
  # Splits a range into a static prefix, and a variable subrange
  #
  # 1..3 -> nil, 1..3
  # 11..13 -> 1, 1..3
  class Splitter
    def initialize(range)
      @range = range
    end

    def static_prefix
      buf = ""
      first.to_s.chars.zip(last.to_s.chars).each do |a, b|
        break unless a == b
        buf << a
      end
      buf
    end

    def subrange
      if static_prefix.empty?
        @range
      else
        subfirst = first.to_s[static_prefix.size..-1]
        sublast  = last.to_s[static_prefix.size..-1]
        if integer?
          subfirst = subfirst.to_i
          sublast = sublast.to_i
        end
        subfirst..sublast
      end
    end

    private

    def integer?
      first.is_a? Integer
    end

    def first
      @range.first
    end

    def last
      @range.last
    end
  end
end
