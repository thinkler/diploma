$ ->
  $.get('/index/role_selection/patient')
  $("#Role").change(() ->
    role = $(this).val()
    $.get('/index/role_selection/' + role)
  )
