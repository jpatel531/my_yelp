class Restaurant < ActiveRecord::Base
	has_many :reviews
	validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'has to start with a capital letter'}
	validates :cuisine, presence: true, length: {minimum: 3}

	def average_rating
		reviews.none? ? "N/A" : reviews.inject(0) {|acc, rev| acc + rev.rating} / reviews.count.to_f
	end


end

