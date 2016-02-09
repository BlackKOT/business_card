jQuery.fn.MytoJson = (options) ->
  options = jQuery.extend({}, options)
  self = this
  json = {}
  push_counters = {}
  patterns =
    'validate': /^[a-zA-Z][a-zA-Z0-9_]*(?:\[(?:\d*|[a-zA-Z0-9_]+)\])*$/
    'key': /[a-zA-Z0-9_]+|(?=\[\])/g
    'push': /^$/
    'fixed': /^\d+$/
    'named': /^[a-zA-Z0-9_]+$/

  @build = (base, key, value) ->
    base[key] = value
    base

  @push_counter = (key) ->
    if push_counters[key] == undefined
      push_counters[key] = 0
    push_counters[key]++

  jQuery.each jQuery(this).serializeArray(), ->
# skip invalid keys
    if !patterns.validate.test(@name)
      return
    k = undefined
    keys = @name.match(patterns.key)
    merge = @value
    reverse_key = @name
    while (k = keys.pop()) != undefined
# adjust reverse_key
      reverse_key = reverse_key.replace(new RegExp('\\[' + k + '\\]$'), '')
      # push
      if k.match(patterns.push)
        merge = self.build([], self.push_counter(reverse_key), merge)
      else if k.match(patterns.fixed)
        merge = self.build([], k, merge)
      else if k.match(patterns.named)
        merge = self.build({}, k, merge)
    json = jQuery.extend(true, json, merge)
    return
  json
