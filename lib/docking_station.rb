require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(custom_capacity={})
		@capacity = custom_capacity.fetch(:capacity, 10)
		@bike_container  ||= []
	end
	
	def release_bike
		bike_container.delete(bike_container.find { |bike| bike.working? })
	end

	def broken_bikes
		bike_container.map { |bike| bike_container.delete(bike) if !bike.working? }
	end

end
