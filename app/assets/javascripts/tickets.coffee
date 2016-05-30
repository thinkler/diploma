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

  $("#datepicker-ticket").change(() ->
    date = $(this).val()
    if (!date)
      date = 'null'
    doc_id = $(this).attr("doc_id") + '/'
    equip_id = $(this).attr("equip_id") + '/'
    spec_id = $(this).attr("spec_id") + '/'
    console.log(equip_id)
    if equip_id == "/"
      equip_id = "null/"
    $.get('/patient/find_day/' + doc_id + equip_id + spec_id + date)
  )

