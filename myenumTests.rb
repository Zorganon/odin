require './myenum.rb'

test_hash1 = Hash.new
test_hash2 = Hash.new
test_ary1 = []
test_ary2 = []
a = [1,2,3,4,5,6,7]

#test 1 my_each
a.my_each { |x| test_ary1 << x }
a.each { |x| test_ary2 << x }
puts test_ary1 == test_ary2 ? "each passes" : "my each FAILED"

#test 2 each-with-index
a.my_each_with_index { |x, i| test_hash1[i] = x }
a.each_with_index { |x, i| test_hash2[i] = x }
puts test_hash2 == test_hash1 ? "each_with_index passes" : " each w index FAILED"

#test 3 select
puts a.my_select {|x| x > 3 } == a.select{|x| x > 3} ? "select passes" : "TEST 3 FAILED"

#test 4 all?
puts a.my_all? {|x| x > 1 } == a.all? {|x| x > 1 } ? "all? passes" : "TEST 4 FAILED"

#test 5 any?
puts a.my_any? {|x| x == 3 } == a.any? {|x| x == 3 } ? "any? passes" : "TEST 5 FAILED"

#test 6 none?
puts a.my_none? {|x| x == 3 } == a.none? {|x| x == 3 } ? "none? passes" : "TEST 6 FAILED"

#test 7 count
puts a.my_count {|x| x == 3 } == a.count {|x| x == 3 } ? "count passes" : "TEST 7 FAILED"

#test 8 map
puts a.my_map {|x| x += 3 } == a.map {|x| x += 3 } ? "map passes" : "TEST 8 FAILED"

#test 9 inject
puts a.my_inject {|sum, n| sum + n } == a.inject {|sum, n| sum + n } ? "inject passes" : "TEST 9 FAILED"

#test 10 multiplier
puts a.multiply_els == a.inject {|prod, n| prod * n } ? "multiply / inject passes" : "TEST 10 FAILED"