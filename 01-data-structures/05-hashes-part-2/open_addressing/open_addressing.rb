require_relative 'hash_node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    i = next_matching_or_nil(key)
    if @items[i]
      @items[i].value = value
    else
      @items[i] = HashNode.new(key, value)
      @item_count += 1
      if load_factor > MAX_LOAD_FACTOR
        resize
      end
    end
  end

  def [](key)
    i = next_matching_or_nil(key)
    if @items[i]
      @items[i].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, range=size)
    sum = 0
    key.each_byte { |char|
      sum += char
    }
    sum % range
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @items[index]
      index = (index + 1) % size
    end
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    old_items = @items
    @items = Array.new(size * 2)
    old_items.each { |node|
      if node
        @items[next_open_index(index(node.key))] = node
      end
    }
  end

  def to_s
    str = "SeparateChaining: load factor: #{load_factor}\n"
    @items.each_index { |i|
      if @items[i]
        str += "[#{i}] #{@items[i]}\n"
      end
    }
    str
  end

  private

  MAX_LOAD_FACTOR = 0.7

  # Calculates an index from key and returns the next index that either contains
  # that key or is nil.
  def next_matching_or_nil key
    i = index(key)
    while @items[i] && @items[i].key != key
      i = (i + 1) % size
    end
    i
  end

  def load_factor
    @item_count.to_f / size
  end
end
