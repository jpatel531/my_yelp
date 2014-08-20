require 'rails_helper'

describe 'restaurant listings page' do 

	context 'with no restaurants' do 

		it 'says there are no restaurants' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
		end	

	end

	context 'with a restaurant' do 
		before {Restaurant.create(name: "KFC", cuisine: "chick")}

		it "says there's a restaurant" do 
			visit '/restaurants'
			expect(page).to have_content 'KFC'
		end
	end
end

describe 'restaurant creation form' do 

	# context 'logged out' do 
	# 	visit '/restaurants'
	# 	expect(page).not_to have_link 'Name'
	# end

	context 'logged in' do 

		before do
			user = User.create(email: "s@s.com", password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should be able to create a restaurant' do 
			visit '/restaurants/new'
			fill_in 'Name', with: 'Burger King'
			fill_in 'Cuisine', with: 'American'
			click_button 'Create Restaurant'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'Burger King (American)'
		end

	end

end

describe 'edit and delete form' do 
	before {Restaurant.create(name: "KFC", cuisine: "chick")}

	context 'editing logged out' do 

		it 'should not be able to edit KFC' do 
			visit '/restaurants'
			expect(page).not_to have_content 'Edit KFC'
		end

	end

	context 'editing logged in' do 

		before do
			user = User.create(email: "s@s.com", password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should be able to edit an existing restaurant' do 
			visit '/restaurants'
			click_link 'Edit KFC'
			fill_in("Name", with: "McDo")
			click_button 'Update Restaurant'
			expect(current_path).to eq '/restaurants'
			expect(page).to have_content 'McDo'
		end

	end


	context 'deleting logged in' do 

		before do
			user = User.create(email: "s@s.com", password: '12345678', password_confirmation: '12345678')
			login_as user
		end

		it 'should be able to delete an existing restaurant' do 
			visit '/restaurants'
			click_link 'Delete KFC'
			expect(page).to have_content 'Successfully deleted KFC'
		end

	end

	context 'deleting logged out' do 

		it 'should not be able to delete a restaurant' do 
			visit '/restaurants'
			expect(page).not_to have_link 'Delete KFC'
		end

	end


end