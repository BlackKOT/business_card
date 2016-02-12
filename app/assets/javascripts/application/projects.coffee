$ ->
  $('body').on 'click', '.img_clc', ->
    url = $(@).data('url')
    $parent = $(@).closest('.item')

    if (url)
      header = '(-_-)'

      modal_window.show(
        modal_window.template(
          false,
          header,
          "<div class='text-center'><img style='height: auto; max-width: 100%;' src='#{url}'/></div>",
          modal_window.close_button()
        )
      )