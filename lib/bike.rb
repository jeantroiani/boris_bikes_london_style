class Bike
	
	def initialize( functioning = true)
	@working = functioning
	end

	def working?
	@working
	end

	def break!
	@working=false
	end

	def fix!
	@working=true
	end


end
