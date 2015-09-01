sms_delimiter = ->
  alert("1")
  ua = navigator.userAgent.toLowerCase()
  alert("2")
  if ua.indexOf('iphone') > -1 or ua.indexOf('ipad') > -1
    alert("3")
    _iOSVersion = Number((navigator.userAgent.match(/\b[0-9]+_[0-9]+(?:_[0-9]+)?\b/) or [ '' ])[0].split('_')[0])
    alert("4")
    a = if (_iOSVersion < 8) then ';' else '&'
    alert("5")
    return a
  else
    return '?'

$ ->
  $sms_field = $('.mobile-sms')
  if $sms_field.length > 0
    mobile_href = $sms_field.attr('href').replace('?', sms_delimiter())
    alert("6")
    window.location = mobile_href
    alert("7")

