#!/usr/bin/env ruby

def fib(n)
  fib = [0, 1]
  (0...n).each {
    temp = fib[0]
    fib[0] = fib[1]
    fib[1] = temp + fib[1]
  }
  fib[0]
end

puts(fib(20))
