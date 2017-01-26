# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  sorted_array = []
  arrays.each do |array|
    array.each do |value|
      biggest = true
      sorted_array.each_index { |i|
        if value < sorted_array[i]
          sorted_array.insert(i, value)
          biggest = false
          break
        end
      }
      if biggest
        sorted_array << value
      end
    end
  end

  # Return the sorted array
  sorted_array
end

RSpec.describe(:poorly_written_ruby) {
  it('flattens and sorts arrays') {
    expect(poorly_written_ruby([1, 0], [2, -2])).to(eq([-2, 0, 1, 2]))
  }
}
