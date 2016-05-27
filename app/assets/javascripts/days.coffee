$ ->
  $("#datepicker").datepicker()

  $('#new-time-btn').click(() ->
    time = $('#new-time').val()
    id = $('h1.center').attr('id')
    $('#new-time').val('')
    $.get('/doctor/days/change_time/add/' + id + '/' + time)
  )

$(document).on('click', '.time .btn', () ->
  time = $(this).attr("id")
  id = $('h1.center').attr('id')
  $.get('/doctor/days/change_time/delete/' + id + '/' + time)
)
