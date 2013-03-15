$(document).on "click", "[data-behavior='updateAnalytics']", (event) ->
  setTimeout ->
    if _gaq?
      _gaq.push(["_trackPageview", (window.location.pathname + window.location.hash)])
    if _gauges?
      _gauges.push(['track'])
  ,
    50
