class Searcher # medium.com/@limichelle21/
#testlul
  # ~ Linear Search ~
  # comparing the key to each item in a list,
  # until it is found
  # O(n * n) time, or O(n^2), worst-case
	
  def linear_search_fast(array, key) # key to be found in array
    if array.index(key).nil? # ruby-exclusive linear search
      return -1 # terminates
    else 
      return "#{key} at index #{array.index(key)}"
    end #{key} prints key, #{array.index(key)} prints index
  end
	
  # note: other languages often use a loop on line 9, making it slower
	
  def linear_search_slow(array, key)
    i = 0
    while i < array.length
      if array[i] == key
        return "#{key} at index #{array.index(key)}"
      end
    i += 1
    end
    return -1
  end
	
  # ~ Binary Search ~
  # only works on sorted arrays
  # divides each array into 2 subarrays,
  # and looks for key in one of them
  # O(log n) time, worst-case
	
  def binary_search_iterative(array, key)
    low, high = 0, array.length - 1 # floor, roof
    while low <= high # space between floor and roof
      mid = (low + high) >> 1 # finding mean
      case key <=> array[mid] # comparator
        when 1 # moving up
          low = mid + 1
        when -1 # moving down
          high = mid - 1
        else # found
          return mid
      end
    end
  end
	
  def get_limits(array)
    [0, array.length - 1]
  end
		
  def binary_search_recursive(array, key, min=0, max=array.size-1)
    mid = (min + max) >> 1
    case array[mid] <=> key
      when 0
        mid
      when -1
        min = mid + 1
        binary_search_recursive(array, key, min, max)
      when 1
        max = mid - 1
        binary_search_recursive(array, key, min, max)
    end
  end
	
  # ~ Depth First Search ~
  # visits (and flags) node, (usually)
  # keeps track of nodes in stack,
  # loops for each adjacent
  # O(V+E), or O(n) worst-case

  def df_search(adj_matrix, source, terminal)
    node_stack = [source]
    loop do
      current_node = node_stack.pop
      return false if current_node == nil
      return true if current_node == terminal
      children = (0..adj_matrix.size-1).to_a.select do |i|
        adj_matrix[current_node][i] == 1
      end
      node_stack += children
    end
  end	

  # ~ Breadth First Search ~
  # visits (and flags) node, (usually)
  # loops for each adjacent
  # keeps track of nodes in stack,
  # O(V+E), or O(n) worst-case

  def bf_search(adj_matrix, source, terminal)
    node_queue = [source]
    loop do
      current_node = node_queue.pop
      p current_node
      return false if current_node == nil
      return true if current_node == terminal
      children = (0..adj_matrix.size-1).to_a.select do |i|
        adj_matrix[current_node][i] == 1
      end
      node_queue = children + node_queue
    end
  end
		
end # class end

arr = [1,3,4,12,16,21,34,45,55,76,99,101]
key = 21
s = Searcher.new
index = s.binary_search_recursive(arr, key)
#p index

adj_matrix = [
  [1, 0, 1, 0, 1, 0],
  [0, 0, 1, 0, 0, 1],
  [0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 1, 1],
  [0, 0, 1, 0, 0, 0],
  [0, 0, 1, 1, 0, 0]
]

p s.bf_search(adj_matrix, 0, 2) # is there a path between 0 and 3?
		
		
