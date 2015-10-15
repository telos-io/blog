# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".bxslider1").bxSlider()

  $(".bxslider2").bxSlider({
    slideWidth: 330,
    minSlides: 2,
    maxSlides: 2,
    slideMargin: 10
  })

  $( ".fade" ).fadeTo( "slow" );
