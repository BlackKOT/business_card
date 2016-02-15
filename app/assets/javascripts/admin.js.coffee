#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_directory ./admin
#= require_directory ./shared
#= require jquery_nested_form
#= require jquery.mask.min
#= require admin/metisMenu.min
# require tinymce-jquery
#= require angular

$ ->
  $('.integer').mask("-9999999999", {translation:  {'-': {pattern: /[-0-9]/, optional: true}}})
