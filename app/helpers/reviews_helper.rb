module ReviewsHelper


	def star_rating(number)
		return 'N/A' unless number.is_a? Numeric
		round = number.round
		return ("★" * round) + ("☆" * (5 - round))
	end


end
