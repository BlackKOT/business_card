#= require jquery.form.json.js.coffee

appModule.service '$FormService', ($http) ->
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
