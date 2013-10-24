# RangeRegexp

Generates regular expressions that match a range.

Ever wanted to write a regex like this?

    prefix = /[612-793]/
    "650" =~ prefix # => true
    "794" =~ prefix # => false

Character classes don't work like that! But now you can:

    prefix = RangeRegexp.new(619..793).regexp
    "650" =~ prefix # => true
    "794" =~ prefix # => false

Happiness!

## Installation

Add this line to your application's Gemfile:

    gem 'range_regexp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install range_regexp

## Usage

Pass a range to the constructor. Get it with #regexp.

    re = RangeRegexp.new(12..24).regexp
    re =~ "12" # => True

It works with strings if you're clever with your range:

    re = RangeRegexp.new("foobar".."foobaz").regexp
    re =~ "foobat" # => true

It knows how many characters it matches:

    RangeRegexp.new(135..643).size # => 3
    RangeRegexp.new(1..9).size # => 1
    RangeRegexp.new("foobar".."foobaz").size # => 6

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
