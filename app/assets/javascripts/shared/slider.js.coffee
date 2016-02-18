#= require owl.carousel.min

window.init_sliders = ->
  $('.owl-carousel:not(.owl-theme)').owlCarousel
    navigation: false
    singleItem: true
    transitionStyle: 'fade'

$ ->
  init_sliders()
