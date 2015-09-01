sms_delimiter = ->
  ua = navigator.userAgent.toLowerCase()
  if ua.indexOf('iphone') > -1 or ua.indexOf('ipad') > -1
    _iOSVersion = Number((navigator.userAgent.match(/\b[0-9]+_[0-9]+(?:_[0-9]+)?\b/) or [ '' ])[0].split('_')[0])
    if (_iOSVersion < 8) then ';' else '&'
  else '?'

$ ->
  $sms_field = $('.mobile-sms')
  if $sms_field.length > 0
    mobile_href = $sms_field.prop('href').replace('?', sms_delimiter())
    window.location.assign(mobile_href)


