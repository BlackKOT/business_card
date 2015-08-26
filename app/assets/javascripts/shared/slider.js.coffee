#= require jcarousel.min
#= require_self

$ ->
  $(".jcarousel").jcarousel()
  $(".jcarousel-control-prev").on("jcarouselcontrol:active", ->
    $(this).removeClass "inactive"
  ).on("jcarouselcontrol:inactive", ->
    $(this).addClass "inactive"
  ).jcarouselControl target: "-=1"
  $(".jcarousel-control-next").on("jcarouselcontrol:active", ->
    $(this).removeClass "inactive"
  ).on("jcarouselcontrol:inactive", ->
    $(this).addClass "inactive"
  ).jcarouselControl target: "+=1"
  $(".jcarousel-pagination").on("jcarouselpagination:active", "a", ->
    $(this).addClass "active"
  ).on("jcarouselpagination:inactive", "a", ->
    $(this).removeClass "active"
  ).jcarouselPagination()


#  $('.jcarousel').jcarousel
#    vertical: false
#
#  $('.jcarousel-prev').jcarouselControl
#    target: '-=1'
#
#  $('.jcarousel-next').jcarouselControl
#    target: '+=1'
#
#  $('.jcarousel-pagination').jcarouselPagination
##    item: (page) ->
##      return '<a href="#' + page + '">' + page + '</a>'
