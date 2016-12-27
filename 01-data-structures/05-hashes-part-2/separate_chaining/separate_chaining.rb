require_relative 'node'

class SeparateChaining
  MAX_LOAD_FACTOR = 0.7

  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = @items[i]
    while n && n.key != key
      n = n.next
    end
    if n
      n.value = value
    else
      n = Node.new(key, value, @items[i])
      @items[i] = n
      @item_count += 1

      # Resize the hash if the load factor grows too large
      if load_factor > MAX_LOAD_FACTOR
        resize
      end
    end
  end

  def [](key)
    list = @items.at(index(key, @items.size))
    while list
      if list.key == key
        return list.value
      end
      list = list.next
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0

    key.split("").each do |char|
      if char.ord == 0
        next
      end

      sum = sum + char.ord
    end

    sum % size
  end

  # Calculate the current load factor
  def load_factor
    @item_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_size = size*2
    new_items = Array.new(new_size)
    @items.each do |bucket|
      while bucket
        i = index(bucket.key, new_size)
        new_items[i] = Node.from_node(bucket, new_items[i])
        bucket = bucket.next
      end
    end

    @items = new_items
  end
end
