#!/usr/bin/env ruby

require('benchmark')

require_relative('linked_list')
require_relative('node')

Benchmark.bm { |x|
  x.report('Make Array') {
    Array.new(10_000)
  }
  x.report('Make LinkedList') {
    ll = LinkedList.new
    (0...10_000).each {
      ll.add_to_front(Node.new(nil))
    }
  }

  array = Array.new(10_000)
  ll = LinkedList.new
  target_node = Node.new(false)
  (0...10_000).each { |i|
     ll.add_to_front(if i == 5000
                       target_node
                     else
                       Node.new(i)
                     end)
  }

  x.report('Get array[5000]') {
    array[5000]
  }
  x.report('Get 5000th node') {
    list = ll.head
    while list.data
      list = list.next
    end
    list
  }

  x.report('Delete array[5000]') {
    array.delete_at(5000)
  }
  x.report('Delete 5000th node') {
    ll.delete(target_node)
  }
}
