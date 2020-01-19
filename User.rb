class User

# Considering status field may have any of those values i.e active, inactive, pending and so on.

def active?
	status.equal? 'active'
end

def pending?
	status.equal? 'pending'
end

def inactive?
	status.equal? 'inactive'
end	

def so_on?
	status.equal? 'so on'
end

end