$ ->
  $('#doc-search').change(() ->
    q = $(this).val()
    if (!q)
      q = 'all'
    $.get('/patient/search/doctors/' + q)
  )

  $('#eq-search').change(() ->
    q = $(this).val()
    if (!q)
      q = 'all'
    $.get('/patient/search/equipment/' + q)
  )

  $('#spec-search').change(() ->
    q = $(this).val()
    if (!q)
      q = 'all'
    $.get('/patient/search/specialities/' + q)
  )

  $('.doctor.btn.btn-danger').click(() ->
    q = 'all'
    $('#doc-search').val('')
    $.get('/patient/search/doctors/' + q)
  )

$(document).on('click', '#doctors .list-group-item', () ->
  id = $(this).attr('id')
  $.get('/patient/select/Doctor/' + id)
)
