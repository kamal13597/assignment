class User

	def initialize()
		# @user =  		
		@user = User.first  //considering this as the User Model file and has the status column in the database.
	end

	def active?
		@user.status.equal? 'active'
	end

	def pending?
		@user.status.equal? 'pending'
	end

	def inactive?
		@user.status.equal? 'inactive'
	end	

end