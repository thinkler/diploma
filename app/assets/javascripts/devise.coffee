$ ->
  $.get('/index/role_selection/admin')
  $("#Role").change(() ->
    role = $(this).val()
    console.log(role)
    $.get('/index/role_selection/' + role)
  )
