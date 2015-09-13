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



angular.module('application').service '$FormService', ($http) ->

  class Form
    submit: ($form) ->
      $http
        url: $form.attr('action') + '.json'
        method: $form.attr('method')
        data: $form.MytoJson()


    displayErrors: ($form, data) =>
      errors = @formatErrors(data)

      for input, messages of errors
        $input = $form.find("input[name=#{input}], input[name*=\"[#{input}]\"], select[name=#{input}], select[name*=\"[#{input}]\"], textarea[name=#{input}], textarea[name*=\"[#{input}]\"]")

        if $input.length > 0
          $group = $input.parent()
          $group.addClass('has-error')
          $group.append("<p class='help-block error-message'>#{messages.join("<br/>")}</p>")

      return


    clearErrors: ($form) =>
      $form.find('.has-error').removeClass('has-error')
      $form.find('p.error-message').remove()

      return


    formatErrors: (data) ->
      data.errors = {} if !data.errors?
      data.errors.base = [] if !data.errors.base?
      data.errors['base'].push(data.error) if data.error?

      return data.errors


  return new Form()
