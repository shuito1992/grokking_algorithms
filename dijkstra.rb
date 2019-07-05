@graph = {
  start:{ a:   2,
          b:   6 },
  a:    { fin: 1 },
  b:    { a:   3,
          fin: 5 },
  fin:  {}
}

@costs = {
  a: 6,
  b: 2,
  fin: Float::INFINITY
}

@parents = {
  a:  :start,
  b:  :start,
  fin: nil
}

@processed = []

def find_lowest_cost_node(costs)
  min = @costs.select{|node,cost| !@processed.include?(node)}.
               min_by{|node, cost| cost}
  min[0] if !min.nil?
end

def dijkstra
  node = find_lowest_cost_node(@costs)
  while !node.nil?
    cost = @costs[node]
    neighbors = @graph[node]
    neighbors.each do |n, c|
      new_cost = cost + neighbors[n]
      if @costs[n] > new_cost
        @costs[n]   = new_cost
        @parents[n] = node
      end
    end
    @processed << node
    node = find_lowest_cost_node(@costs)
  end
end

dijkstra
puts @costs
puts @parents

puts "-"*10
puts "Exercise A"
@graph = {
  start:{ a:   5,
          b:   2 },
  a:    { c:   4,
          d:   2 },
  b:    { a:   8,
          d:   7 },
  c:    { d:   6,
          fin: 3 },
  d:    { fin: 1 },
  fin:  {}
}
@costs = {
  a: 5,
  b: 2,
  c:   Float::INFINITY,
  d:   Float::INFINITY,
  fin: Float::INFINITY
}
@parents = {
  a:  :start,
  b:  :start,
  c:   nil,
  d:   nil,
  fin: nil
}
@processed = []

dijkstra
puts @costs
puts @parents

puts "-"*10
puts "Exercise B"
@graph = {
  start: { a: 10 },
  a:     { b: 20 },
  b:     { c: 1,
           fin: 30 },
  c:     { a: 1 },
  fin:   {}
}
@costs = {
  a: 10,
  b:   Float::INFINITY,
  c:   Float::INFINITY,
  fin: Float::INFINITY
}
@parents = {
  a: :start,
  b:   nil,
  c:   nil,
  fin: nil
}
@processed = []

dijkstra
puts @costs
puts @parents

puts "-"*10
puts "Exercise C"
@graph = {
  start: { a: 2,
           b: 2 },
  a:     { c: 2,
           fin: 2 },
  b:     { a: 2 },
  c:     { b: -1,
           fin: 2 },
  fin:   {}
}
@costs = {
  a: 2,
  b: 2,
  c:   Float::INFINITY,
  fin: Float::INFINITY
}
@parents = {
  a: :start,
  b: :start,
  c: nil,
  fin: nil
}
@processed = []

dijkstra
puts @costs
puts @parents