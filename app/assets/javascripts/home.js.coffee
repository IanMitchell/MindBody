$ ->
  $('#searchbox').focus
  $('#searchbox').typeahead
    name: "location"
    remote: "/autocomplete?query=%QUERY"
