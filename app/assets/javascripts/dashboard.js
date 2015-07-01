var searchHandler = function(e) {
  if(e.keyCode === 13) {
    var input = $(this).val()
    var lat = input.split(",")[0]
    var long = input.split(",")[1]

    $.ajax("/v1", {
      data: {
        latitude: lat,
        longitude: long
      },
      error: function() { alert("Failed to fetch data") },
      // success: function(resp) {
      //   updateDisplay(resp)
      // }
      success: updateDisplay
    })
  }
}

var updateDisplay = function(stations) {
  $("ul.search-results").empty()
  var locs = stations.locations
  for (var i=0; i<locs.length; i++) {
    var l = locs[i]
    var $new_node = $("<li/>").text(l.name + " (" + l.type + ")").addClass(l.type);
    $("ul.search-results").append($new_node)
  }
}

$(function() {
  $(".location-search").on("keyup", searchHandler)

  $(".show-metro").on("click", function() {
    $(".metro").show()
    $(".bikeshare").hide()
  })
  $(".show-bike").on("click", function() {
    $(".bikeshare").show()
    $(".metro").hide()
  })
  $(".show-all").on("click", function() {
    $(".metro").show()
    $(".bikeshare").show()
  })
})