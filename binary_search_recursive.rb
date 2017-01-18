#!/usr/bin/env ruby

def binary_search array, value, low=0, high=nil
  high = high || array.size
  if low < high
    mid = (low + high) / 2
    if array[mid] > value
      binary_search(array, value, low, mid)
    elsif array[mid] < value
      binary_search(array, value, mid + 1, high)
    else
      mid
    end
  end
end
