class Sorter # medium.com/@limichelle21/
	
  # ~ Bubble Sort ~ 
  # sorts by swapping adjacent,
  # akin to linkedlist-relations
  # is sorted if swap == false
  # O(n^2) worst-case
	
  def bubble_sort(array)
    return array if array.size <= 1 # base
    swap = true # bool
      while swap # loop
        swap = false # break
        (array.size - 1).times do |x| # iterator
          if array[x] > array[x+1] # compare
            array[x], array[x+1] = array[x+1], array[x] # swap
            swap = true # condition
          end
        end
      end
    array # return
  end

  # ~ Insertion Sort ~
  # assigned a hand of cards,
  # choose a constant
  # sort around the constant
  # O(n^2) worst-case
	
  def insertion_sort(array)
    (array.size).times do |j| # iterator
      while j > 0 # loop
        if array[j-1] > array[j] # compare
          array[j], array[j-1] = array[j-1], array[j] # swap
        else
          break # break
        end
        j -= 1 # condition
      end
    end
    array # return
  end
	
  # ~ Selection Sort ~
  # looks for the min. element,
  # puts it at the front of a sep. array
  # thus maintains 2 arrays, but can do 1 in Ruby
  # O(n * n), or O(n^2) worst-case
	
  def selection_sort(array)
    n = array.size - 1 # multiple references
    n.times do |i| # loop
      min_index = i # min. element
      for j in (i + 1)..n # nested loop
        min_index = j if array[j] < array[min_index] # compare
      end
      array[i], array[min_index] = array[min_index], array[i] if min_index != i # swap
    end
    array # return
  end
	
  # ~ Merge Sort ~ (binary search on steroids)
  # divides every array into 2,
  # focuses only the relevant array,
  # recurses until complete
  # diamond shaped:
  # input array split into two (recursive)
  # ends up as one return array
  # O(n log n) worst-case:
  # n times binary searches,
  # which are O(log n) alone

  def merge_sort(array)
    if array.size <= 1 # base
      array
    else
      mid = (array.size / 2).floor # midpoint
      left = merge_sort(array[0..mid-1]) # array-halfing up until midpoint
      right = merge_sort(array[mid..array.size]) # array-halfing from mid point til roof
      merge(left, right) # merge recursion start & return
    end
  end
	
  def merge(left, right)
    if left.empty? # ignore left
      right
    elsif right.empty? # ignore right
      left
    elsif left[0] < right[0] # left smallest
      [left[0]] + merge(left[1..left.size], right) # sorts left first
    else # right smallest
      [right[0]] + merge(left, right[1..right.size]) # sorts right first
    end
  end
	
  # ~ Quick Sort ~
  # picks a (random) pivot,
  # sorts accordingly,
  # quicksorts each half of the pivot sort (recursive)
  # O(n log n) average-case, O(n^2) worst-case (rare)
	
  def quick_sort(array)
    return array if array.size <= 1 # base
    pivot = array.delete_at(rand(array.size)) # pivot & removal
		
    left = Array.new
    right = Array.new
		
    array.each do |x| # iterator
      if x <= pivot # compare less than
        left << x # add x to left
      else # compare greater than
        right << x # add x to right
      end
    end
		
    return *quick_sort(left), pivot, *quick_sort(right) # recursion start & return
  end
	
  # ~ Heap Sort ~ (map heap / tree structure)
  # sorts by converting array to new (max) heap,
  # repeatedly picks and replaces root node,
  # where root node is max. node of the heap
  # O(n log n) worst-case
	
  def heap_sort(array)
    n = array.size - 1
    a = array
		
    (n / 2).downto(0) do |i|
      create_max_heap(a, i, n) # max heap
    end
		
    while n > 0 # loop
      a[0], a[n] = a[n], a[0] # swap root
      n -= 1
      create_max_heap(a, 0, n) # rebuild heap
    end
    a # original size
  end
	
  def create_max_heap(array, parent, limit)
    root = array[parent] # find root node
    while (child = 2 * parent) <= limit do # compare limit != child
      child += 1 if child < limit && array[child] < array[child + 1] # add child
      break if root >= array[child] # sort complete
      array[parent], parent = array[child], child # swap if not complete
    end
    array[parent] = root # update root to return heap
  end

end # class end

s = Sorter.new
p s.heap_sort([5, 1, 78, 20, 0, 12])