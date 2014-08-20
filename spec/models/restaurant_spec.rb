require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
  
	describe '#average_rating' do 

		let(:kfc) { Restaurant.create name:'KFC', cuisine: 'Chicken'}

		it 'returns N/A if there are no reviews' do 
			expect(kfc.average_rating).to eq 'N/A'
		end

		it 'returns the rating of 1 review when sole review' do 
			kfc.reviews.create(rating: 3)
			expect(kfc.average_rating).to eq 3
		end


		it 'returns average of multiple reviews' do 
			kfc.reviews.create(rating: 1)
			kfc.reviews.create(rating: 3)
			expect(kfc.average_rating).to eq 2
		end

		it 'returns average as a float' do 
			kfc.reviews.create(rating: 1)
			kfc.reviews.create(rating: 2)
			expect(kfc.average_rating).to eq 1.5
		end
	end

	describe 'validations' do 

		it 'errors out if there is no restaurant name given' do 
			restaurant = Restaurant.create(name: nil)
			expect(restaurant).to have(2).error_on(:name)
		end

		it 'should have a name with the first letter capitalized' do 
			restaurant = Restaurant.new(name: 'mcdo')
			expect(restaurant).to have(1).errors_on(:name)
		end

		it 'should have a cuisine' do 
			restaurant = Restaurant.new(cuisine: nil)
			expect(restaurant).to have(2).errors_on(:cuisine)
		end

		it 'shoudld have a cuisine of at least 3 chars' do 
			restaurant = Restaurant.new(cuisine: 'lo')
			expect(restaurant).to have(1).error_on(:cuisine)
		end

	end

end
