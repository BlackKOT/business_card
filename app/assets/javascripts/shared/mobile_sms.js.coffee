sms_url_update = (url)->
  ua = navigator.userAgent.toLowerCase()
  if ua.indexOf('iphone') > -1 or ua.indexOf('ipad') > -1
    _iOSVersion = Number((navigator.userAgent.match(/\b[0-9]+_[0-9]+(?:_[0-9]+)?\b/) or [ '' ])[0].split('_')[0])
    if (_iOSVersion < 8)
      return url.replace('?', ';')
    else
      return url.replace('?', '&')

  return url

$ ->
  $sms_field = $('.mobile-sms')
  if $sms_field.length > 0
    mobile_href = sms_url_update($sms_field.prop('href'))
    $sms_field.prop('href', mobile_href)
    window.location = mobile_href
    return false
