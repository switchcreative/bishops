navigateDailySpecials = (id) ->
  $target  = $(id)
  $overlay = $("#{id}-overlay")

  $target
    .siblings().hide()
    .end().show()
  $overlay.stop(true, true)
    .siblings()
    .stop(true, true).css("z-index", 1).slideUp()
    .end()
    .css("z-index", 2).slideDown().delay(2000).slideUp()

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


# Navigate daily specials with left & right arrow keys
$(document).on "keydown", (event) ->
  $current = $("[id*='daily-specials-']:visible")
  key = event.keyCode
  if key is 37 #=> Left Arrow
    id = $current.data("prev-special")
    navigateDailySpecials(id)
  if key is 39 #=> Right Arrow
    id = $current.data("next-special")
    navigateDailySpecials(id)


# Prev/next buttons for daily specials
$(document).on "click", "[data-behavior='daily-special']", (event) ->
  event.preventDefault()
  id = $(@).attr("href")
  navigateDailySpecials(id)
