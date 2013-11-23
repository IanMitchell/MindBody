<% if @new_location.errors.any? %>
  $('#new-location-errors').slideUp( ->
      $('#new-location-errors').html ''
      $('<%= escape_javascript error_messages_for(@new_location) %>')
        .appendTo('#new-location-errors')
    )
    $('#new-location-errors').slideDown()
<% else %>
  $('.close-reveal-modal').click();
  document.location.reload(true)
<% end %>
