appModule.service '$TemplateService', ($http, $templateCache) ->
  class Template
    constructor: ->
      @template = ''

    load: (name) ->
      $http
        .get(name, cache: $templateCache).success(tplContent)->
          @template = tplContent

    inject_loop_elem: (html_injection) ->
      angular.element(@template).wrap(html_injection)

    compile: (scope) ->
      $compile(@template)(scope)

  new Template()





#app.directive 'loadTemplate', ($http, $templateCache, $compile, $parse) ->
#  {
#  restrict: 'E'
#  link: (scope, iElement, iAttrs) ->
#    boom = $parse(iAttrs.data)(scope)
#    $http.get('myTemplate' + boom, cache: $templateCache).success (tplContent) ->
#      iElement.replaceWith $compile(tplContent)(scope)
#      return
#    return
#
#  }
