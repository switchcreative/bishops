navigateDailySpecials = (id) ->
  $target  = $(id)
  $overlay = $("#{id}-overlay")
  $target.siblings().hide().end().show()
  $overlay.siblings().stop(true, true).fadeOut().end().fadeIn().delay(2000).fadeOut()
  $(window).trigger 'resize'
  if _gaq?
    _gaq.push(["_trackPageview", (window.location.pathname + id)])

# Swipe left for previous daily special
$(document).hammer().on "swipeleft", "[data-prev-special]", (event) ->
  id = $(@).data("prev-special")
  navigateDailySpecials(id)

# Swipe right for next daily special
$(document).hammer().on "swiperight", "[data-next-special]", (event) ->
  id = $(@).data("next-special")
  navigateDailySpecials(id)

# Prev/next buttons for daily specials
$(document).on "click", "[data-behavior='daily-special']", (event) ->
  event.preventDefault()
  id = $(@).attr("href")
  navigateDailySpecials(id)
