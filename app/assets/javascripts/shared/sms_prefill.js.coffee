get_sms_format = ->
  ua = navigator.userAgent.toLowerCase()
  if ua.indexOf('iphone') > -1 or ua.indexOf('ipad') > -1
    _iOSVersion = Number((navigator.userAgent.match(/\b[0-9]+_[0-9]+(?:_[0-9]+)?\b/) or [ '' ])[0].split('_')[0])
    if (_iOSVersion < 8) then ';' else '&'
  else '?'

$ ->
  delim = get_sms_format
  $.each($('.mobile-sms'),->
    mobile_href = $(@).attr('href').replace('{{1}}', delim)
    $(@).attr('href', mobile_href)
  )
