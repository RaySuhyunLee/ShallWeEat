# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready ->
	$('.carousel').carousel
    pause: 'false'
    interval: 4000
  $('.carousel').css
    'margin': 0
    'width': $(window).outerWidth()
    'height': $(window).outerHeight()
  $('.carousel .item').css
    'position': 'fixed'
    'width': '100%'
    'height': '100%'
  $('.carousel-inner div.item img').each ->
    imgSrc = $(this).attr('src')
    $(this).parent().css
      'background': 'url(' + imgSrc + ') center center no-repeat'
      '-webkit-background-size': '100% '
      '-moz-background-size': '100%'
      '-o        -background-size': '100%'
      'background-size': '100%'
      '-webkit-background-size': 'cover'
      '-moz-background-size': 'cover'
      '-o-background-size': 'cover'
      'background-size': 'cover'
    $(this).remove()
    return
  $(window).on 'resize', ->
    $('.carousel').css
      'width': $(window).outerWidth()
      'height': $(window).outerHeight()
    return
  return
