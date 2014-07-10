require_relative 'bike_container'
class Van

	include BikeContainer

	def initialize(custom_capacity={})
		@capacity = custom_capacity.fetch(:capacity, 10)
		@bike_container  ||= []
	end

	def release(bike)
		bike_container.delete(bike)
	end

	def release_all_bikes_to(receptor)
		receptor.receive_bikes(bike_container.map { |bike| bike_container.delete(bike) })
	end

	def request_broken_bikes_from(station)
		station.broken_bikes.each do |broken_bike| 
			store(broken_bike)
		end
	end

	def request_fixed_bikes_from(garage)
		garage.fixed_bikes.each { |fixed_bike| store(fixed_bike) }
	end

end
