$ ->
  $.get('/index/role_selection/admin')
  $("#Role").change(() ->
    role = $(this).val()
    $.get('/index/role_selection/' + role)
  )
