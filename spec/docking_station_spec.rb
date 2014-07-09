require 'docking_station'
	
	describe DockingStation do
		
		it 'Has a empty bike container at the beginning' do
			the_station = DockingStation.new
			expect(the_station.bike_container).to eq []
		end


	it 'can store a bike' do
			the_station=DockingStation.new
			bike = double :bike
			the_station.store(bike)
			expect(the_station.bike_container).to eq [bike]
		end


	it'can release bikes' do
		the_station=DockingStation.new
		the_bike = double :bike, working?: true
		the_station.store(the_bike)
		expect(the_bike).to receive(:working?)
		the_station.release_bike
		expect(the_station.bike_container).to eq []
	end
	it'has a default capacity'do
		 the_dock=DockingStation.new
		 expect(the_dock.capacity).to eq(10)
	end

	it'has a custom capacity'do
		the_dock=DockingStation.new(capacity: 20)
		expect(the_dock.capacity).to eq 20
	end 

	it 'has a list of broken bikes' do
		station = DockingStation.new
		bike = double :bike, working?: false
		station.store(bike)
		expect(station.broken_bikes).to eq [bike]
	end

	it 'has  alist of fixed bikes' do

	end
	
	it' receives a bike from user' do
		station = DockingStation.new
		return_bike
	end


end