$('#map').on 'inview', (event, isInView, visiblePartX, visiblePartY)->
  $("#map-marker").toggleClass("is-visible", isInView)

jQuery ->
  $("#map-marker").removeClass("is-visible")
