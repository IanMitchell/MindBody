$ ->
  $('#location_tag_tokens').tokenInput "/tags.json",
    theme: "facebook"

  $('#searchbox').focus
  $('#searchbox').typeahead
    name: "location"
    remote: "/autocomplete?query=%QUERY"
