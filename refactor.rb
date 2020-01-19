# Example One:

def get_addresses
 addresses = []
 users = User.all
 users.each do |user|
 addresses << user.address if user.address.city.present?
 end
 addresses
end 

# Solution
-----------------
def get_addresses
 addresses = []
 users = User.pluck(:address) 
 // instead of iterating over the whole data set. We pluck the the specific column on which we have set certain opertion. Hence, performance is improved. 
 users.each do |user|
 addresses << user if user.city.present?
 end
 addresses
end 

**********************************************************************************************

#Example 2:

class Greeting
 def name=(value)
 @name = value
 end

 def name
 @name
 end
end 

# Solution
---------------

class Greeting
 attr_accessor :name
 // this ruby method generates the automatic Getter & Setter method for the given variable.
end 


*********************************************************************************************


# Example 3:

def sum(a, b)
 a + b
end

def sum(p, q, r)
 p + q + r
end

def sum(x, y, z, w)
 x + y + z + w
end

sum(2, 3) #=> 5
sum(1,2,3,4) # => 10


# Solution
---------------

#Ruby doesn't support funtion overloading. So this wouldn't  work

#Solution 1: 
-------------

def sum(x, y = 0, z = 0, w = 0 )
 x + y + z + w
end

sum(2, 3) #=> 5
sum(1,2,3,4) # => 10


#Solution 2:
----------------

def sumy(*args)
	# puts args;
	# puts args.class;
	case args.size 
		when 1
			puts args[0]
		when 2	
			puts args[0] + args[1]
	end		
end

sum(2, 3) #=> 5
sum(1,2,3,4) # => 10
