class Node
  # We make value changeable because that's at the core of changing what a key
  # points to. The rest is immutable. (We can't currently remove keys from the
  # hash table.)
  attr_reader :next
  attr_reader :key
  attr_accessor :value

  def initialize(key, value, next_)
    @key = key
    @value = value
    @next = next_
  end

  # Copy a Node, but with a different next field.
  def self.from_node node, next_
    new(node.key, node.value, next_)
  end
end
