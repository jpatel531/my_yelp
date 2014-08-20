require 'rails_helper'

describe 'writing reviews' do 

	before do 
		Restaurant.create name: 'Chilly Joes Fun Food', cuisine: 'Mexican'
		user = User.create(email: "j@j.com", password: "12345678", password_confirmation: "12345678")
		login_as user
	end

	it 'should add a review to the restaurant' do 
		visit '/restaurants'
		click_link 'Review Chilly Joes Fun Food'
		fill_in 'Thoughts', with: 'Dench!'
		select '5', from: 'Rating'
		click_button 'Create Review'

		expect(page).to have_content 'Dench! (★★★★★)'
	end
end