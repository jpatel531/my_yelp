# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 
 $(document).ready ->
 	$('.new_review').on 'submit', (event) ->
 		event.preventDefault()
 		restaurant = $(@).closest('.restaurant')
 		$.post $(@).attr('action'), $(@).serialize(), (review) ->
 			restaurant.find('ul.reviews').append("<li>#{review.thoughts} (#{review.rating}) </li>")
 			restaurant.find('.average_rating').text(review.new_average_rating)
