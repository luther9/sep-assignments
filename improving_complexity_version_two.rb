# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)
  sorted_array = []
  arrays.each do |array|
    array.each do |value|
      if sorted_array.size == 0 || value < sorted_array[0]
        sorted_array.insert(0, value)
      else
        lo = 0
        hi = sorted_array.size
        while hi - lo > 1
          mid = (lo + hi) / 2
          if value < sorted_array[mid]
            hi = mid
          else
            lo = mid + 1
          end
        end
        sorted_array.insert(hi, value)
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
