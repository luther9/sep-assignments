def nearest_neighbor graph, start
  path = []
  visited = {}
  while true
    path << start
    visited[start] = true
    min_distance = Float::MAX
    min_city = nil
    graph[start].each_pair { |city, distance|
      if !visited[city] && distance < min_distance
        min_city = city
        min_distance = distance
      end
    }
    if !min_city
      break
    end
    start = min_city
  end
  path
end

RSpec.describe(:nearest_neighbor) {
  let(:graph) {
    # For the graph to be correct, each city must point to a hash of all other
    # cities that are in the graph.
    {
      Atlanta: {Chicago: 11, Moscow: 56},
      Chicago: {Atlanta: 11, Moscow: 100},
      Moscow: {Atlanta: 56, Chicago: 100},
    }
  }
  let(:path) {
    nearest_neighbor(graph, :Atlanta)
  }

  it("has the start city at the beginning") {
    expect(path[0]).to(eq(:Atlanta))
  }

  it("visits every city") {
    expect(path.size).to(eq(graph.size))
  }

  it("visits each city once") {
    seen = {}
    path.each { |city|
      expect(seen[city]).to(be_nil)
      seen[city] = true
    }
  }
}
