require 'garage'
require_relative 'bike_container_spec'

	describe Garage do
		it_behaves_like 'a bike container'

		it 'have a default capacity at the beginning' do
			garage = Garage.new
			expect(garage.capacity).to eq 20
		end

		it 'has a costume capacity' do
			garage = Garage.new(capacity: 30)
			expect(garage.capacity).to eq 30
		end

		it 'has a bike container empty at the beginning' do
			garage = Garage.new
			expect(garage.bike_container).to eq []
		end

		it 'releases fixed bikes' do
			garage = Garage.new
			bike = double :bike, working?: false
			garage.store(bike)
			expect(bike).to receive(:fix!).and_return(bike)
			expect(garage.fixed_bikes).to eq [bike]
		end

		it 'doesnt have the bikes after releasing them' do
			garage = Garage.new
			bike = double :bike, working?: false
			garage.store(bike)
			expect(bike).to receive(:fix!).and_return(bike)
			garage.fixed_bikes
			expect(garage.bike_container).to eq []
		end

	end