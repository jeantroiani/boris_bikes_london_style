class Van

	def bike_container
		@bike_container ||= []
	end

	def store(bike)
		bike_container << bike
	end

	def release(bike)
		bike_container.delete(bike)
	end

	def request_broken_bikes_from(station)
		station.broken_bikes.each do |broken_bike| 
			store(broken_bike)
			station.release(broken_bike)
		end
	end

	def request_fixed_bikes_from(garage)
		garage.fixed_bikes.each { |fixed_bike| store(fixed_bike) }
	end

end
