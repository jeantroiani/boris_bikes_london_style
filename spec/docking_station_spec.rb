require 'docking_station'
require_relative 'bike_container_spec'
	
	describe DockingStation do

		it_behaves_like 'a bike container'

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

	it" doesn't have broken bikes once delivered" do
		station = DockingStation.new
		broken_bike = double :bike, working?: false
		working_bike = double :bike, working?: true
		station.store(broken_bike)
		station.store(working_bike)

		station.broken_bikes
		expect(station.bike_container).to eq [working_bike]
	end

	



end