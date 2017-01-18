#!/usr/bin/env ruby

def binary_search array, value
  low = 0
  high = array.size
  while low < high
    mid = (low + high) / 2
    if array[mid] > value
      high = mid
    elsif array[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
end
