class BinarySearch

	def get_limits(array)
		[0, array.length - 1]
	end
		
	def binary_search_recursive(array, key)
	
		low, high = get_limits(array)
		
		mid = (low + high) / 2
		
		return -1 if low > high
		
		return binary_search_recursive(array[low, mid-1], key) if (array[mid] > key)
		
		return binary_search_recursive(array[mid+1, high], key) if (array[mid] < key)
		
		return mid if (array[mid] == key)
		
	end
		
end		

arr = [1,3,4,12,16,21,34,45,55,76,99,101]
key = 21
s = BinarySearch.new
index = s.binary_search_recursive(arr, key)
puts index