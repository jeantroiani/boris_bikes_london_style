require 'van'

describe Van do
	it 'have a empty bike container' do
		the_van = Van.new
		expect(the_van.bike_container).to eq []
	end

	it ' can store bikes' do
		the_van = Van.new
		the_bike = double :bike
		the_van.store(the_bike)
		expect(the_van.bike_container).to eq [the_bike]
	end

	it 'can release a bikes' do
		the_van = Van.new
		the_bike = double :bike
		the_van.store(the_bike)
		the_van.release(the_bike)
		expect(the_van.bike_container). to eq []
	end

	it 'can request broken bikes from station' do
		van = Van.new
		bike = double :bike
		station = double :station, broken_bikes: [bike]
		expect(station).to receive(:release).with(bike)
		van.request_broken_bikes_from(station)

	end

	it'has the broken bikes stored after requested' do
		van = Van.new
		bike = double :bike
		station = double :station, broken_bikes: [bike]
		expect(station).to receive(:release).with(bike)
		van.request_broken_bikes_from(station)
		expect(van.bike_container).to eq [bike]
	end

	it'can request fixed bikes from garage' do
		van = Van.new
		bike = double :bike
		station = double :station
		garage = double :garage, fixed_bikes: [bike, bike]

		expect(garage).to receive(:fixed_bikes).and_return [bike, bike]
		van.request_fixed_bikes_from(garage)
	end

	it 'has fixed bikes stored after requested' do
		van = Van.new
		bike = double :bike
		garage = double :garage, fixed_bikes: [bike, bike]
		van.request_fixed_bikes_from(garage)
		expect(van.bike_container).to eq [bike,bike]
	end

end