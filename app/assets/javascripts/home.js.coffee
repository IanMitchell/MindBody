$ ->
  $('#searchbox').typeahead
    name: "tag"
    remote: "/autocomplete?query=%QUERY"
