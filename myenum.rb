module Enumerable

	#should yield each element to the block, then return the original array.
	def my_each
		orig = self
		for x in self
			yield x
		end
		return orig
	end

	def my_each_with_index
		orig = self
		len = self.length
		for x in 0...len
			yield [self[x], x]
		end
		return orig
	end

	def my_select
		newArry = []
		copy = self
		copy.my_each do |x|
			if yield(x) == true
				newArry << x
			end
		end
		return newArry
	end

	def my_all?
		self.my_each do |x|
			return false if yield(x) == false
		end
		return true
	end

	def my_any?
		self.my_each do |x|
			return true if yield(x) == true
		end
		return false
	end

	def my_none?
		self.my_each do |x|
			return false if yield(x) == true
		end
		return true
	end

	def my_count
		counter = 0
		self.my_each do |x|
			counter += 1 if yield(x) == true
		end
		counter
	end

	def my_map
		newArry = []
		self.my_each do |x|
			newArry << yield(x)
		end
		newArry
	end

	def my_inject
		collection_holder = self
		accumulator = collection_holder.slice!(0)
		collection_holder.my_each do |x|
			accumulator = yield(accumulator, x)
		end
		accumulator
	end

	def multiply_els
		prod = 1
		prod = self.my_inject { |product, n| product * n }		
		prod
	end
end

