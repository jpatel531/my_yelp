require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, :type => :helper do
 
	describe '#star_rating' do 

		it "returns n/a when avg. rating not a number" do 
			expect(star_rating 'N/A').to eq 'N/A'
		end


		it "returns 5 black stars when avg rt is 5" do 
			expect(star_rating(5)).to eq '★★★★★'
		end

		it "returns 3 black and 2 white when a r is 3" do 
			expect(star_rating(3)).to eq '★★★☆☆'
		end

		it "rounds up stars on a float a r" do 
			expect(star_rating(2.5)).to eq '★★★☆☆'
		end

	end

end
