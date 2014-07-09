class DockingStation

	def initialize(custom_capacity={})
		@capacity = custom_capacity.fetch(:capacity, 10)
	end

	def bike_container
		@bike_container ||= []
	end

	def store(bike)
		bike_container << bike
	end

	def release_bike
		bike_container.delete(bike_container.find { |bike| bike.working? })
	end

	def capacity
		@capacity
	end

	def broken_bikes
		bike_container.select { |bike| !bike.working? }
	end


end
