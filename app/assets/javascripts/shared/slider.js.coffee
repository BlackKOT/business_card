#= require wallop.min
#= require jquery.event.move
#= require jquery.event.swipe
#= require_self

$ ->
  wallopEl = document.querySelector('.Wallop');
  slider = new Wallop(wallopEl);

  slides = jQuery('.Wallop-item')

  slides
    .on 'movestart', (e) ->
      if ((e.distX > e.distY && e.distX < -e.distY) || (e.distX < e.distY && e.distX > -e.distY))
        e.preventDefault();

    .on 'swipeleft', ->
      slider.next();

    .on 'swiperight', ->
      slider.previous();

