require 'bike_container'

shared_examples_for 'a bike container' do
	let(:container) {described_class.new}

	it 'can store a bike' do
		bike = double :bike
		container.store(bike)
		expect(container.bike_container).to eq [bike]
	end

	it 'have a empty bike container' do 
		expect(container.bike_container).to eq []
	end

	it 'can receive a group of working bikes' do
		working_bike = double :bike, working?: true

		container.receive_bikes([working_bike])
		expect(container.bike_container).to eq([working_bike]) 
	end

	it'expect the station to be full' do
			
			working_bike = double :bike, working?: true
			(container.capacity).times { container.bike_container << working_bike}
			expect(container.full).to be true 
	end

	it"raise an error when it's full" do
	
		working_bike = double :bike, working?: true
		(container.capacity).times { container.bike_container << working_bike}

		expect{container.store(working_bike)}.to raise_error(RuntimeError)
	end

end