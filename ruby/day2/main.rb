puts File.read("./random.txt")

File.open("./random.txt") do |file|
  file.each do |line|
    puts "derp"+line
  end
end

hash = {a: "a", b: "b"}
puts hash.values
puts hash.keys
puts hash.map { |key, value| "#{key}:::#{value}"}

arr = ["a", "b", "c", "d"]
puts Hash[*arr]


arr2 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

arr2.each do |val|
  if val % 4 == 0
    puts arr2[val-4..val-1]
    puts
  end
end


class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|child| child.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby", [Tree.new("child1"), Tree.new("child2")])

ruby_tree.visit do |node|
  puts node.node_name
end

ruby_tree.visit_all do |node|
  puts node.node_name
end

class Tree2
  attr_accessor :node_name, :children

  def initialize(hash)
    key = hash.keys[0]
    @node_name = key
    @children = hash[key]
  end

  def visit_all(&block)
    visit &block
    children.each do |key, value|
      childC = Tree2.new({key => value})
      childC.visit_all &block
    end
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree2 = Tree2.new({ 'grandpa' => {'dad' => {'child' => {}, 'child2' => {} }, 'uncle' => {'child3' => {}, 'child4' => { 'greatgrandson' => { 'gggson' => {}, 'ggggdaughter' => { 'ggggggdaugshter' => {}}}}}  }})

ruby_tree2.visit do |node|
  puts node.node_name
end

ruby_tree2.visit_all do |node|
  puts node.node_name
end
