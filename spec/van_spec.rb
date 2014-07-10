require 'van'
require_relative 'bike_container_spec'

describe Van do

	it_behaves_like 'a bike container'

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
		van.request_broken_bikes_from(station)

	end

	it'has the broken bikes stored after requested' do
		van = Van.new
		bike = double :bike
		station = double :station, broken_bikes: [bike]
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

	it 'can release a group a bike' do
		van = Van.new
		bike = double :bike
		garage = double :garage
		van.store(bike)
		expect(garage).to receive(:receive_bikes).with([bike])

		van.release_all_bikes_to(garage)
	end

	it"doesn't have bikes after release a group of them" do
		van = Van.new
		bike = double :bike
		garage = double :garage
		van.store(bike)

		expect(garage).to receive(:receive_bikes).with([bike])

		van.release_all_bikes_to(garage)

		expect(van.bike_container).to eq []
	end


end