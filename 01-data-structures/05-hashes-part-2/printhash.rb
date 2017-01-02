#!/usr/bin/env ruby

require_relative('separate_chaining/separate_chaining')
require_relative('open_addressing/open_addressing')

[SeparateChaining, OpenAddressing].each { |type|
  hash = type.new(3)
  hash['zero'] = 0
  hash['one'] = 1
  hash['two'] = 2
  hash['three'] = 3
  hash['four'] = 4
  puts(hash)
}
