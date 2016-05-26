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
