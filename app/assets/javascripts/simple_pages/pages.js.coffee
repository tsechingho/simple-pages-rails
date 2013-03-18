$ ->
  $('.pages .chzn-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'

  $('.pages')
    .on 'focusout', '#page_url', ->
      if $(this).val().length > 0
        if ! /^([\w\-]{3,})$/.test($(this).val())
          alert('Invalid URL!')
          $(this).val('')
    .on 'submit', '.simple_form', (event) ->
      url = $('#page_url')
      if url.val().length > 0
        if ! /^([\w\-]{3,})$/.test(url.val())
          alert('Invalid URL!')
          url.val('')
          return false
