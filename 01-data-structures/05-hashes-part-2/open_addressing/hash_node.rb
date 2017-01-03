class HashNode
  attr_reader :key
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def to_s
    "#@key: #@value"
  end
end
