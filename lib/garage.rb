require_relative 'bike_container'
class Garage
	include BikeContainer

		def initialize(options = {})
				@capacity = options.fetch(:capacity, 20)
				@bike_container ||=[]
		end

		def fixed_bikes
			bike_container.map do |bike| 
				bike.fix!
				bike_container.delete(bike)
			end
		end


end