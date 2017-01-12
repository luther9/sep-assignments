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

puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
