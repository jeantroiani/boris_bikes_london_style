module BikeContainer

	def store(bike)
		raise" Sorry, we are full" if full
		bike_container << bike
		nil
	end

	def bike_container
		@bike_container
	end

	def capacity
		@capacity
	end

	def receive_bikes(load)
		load.each {|bike|store(bike)}
	end

	def full
		bike_container.count == capacity
	end

end


