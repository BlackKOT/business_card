componentsCtrl = appModule.controller('componentsCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
    .get('/admin/components.json')
    .success((response) ->
      $scope.components = response.components
    )

#  $scope.submit = () ->
#    url = '/admin/components'
#
#    if $scope.component.hasOwnProperty('id')
#      $http.put(url + '/' + $scope.component.id, {componnet: $scope.component})
#    else
#      $http.post(url, {componnet: $scope.component})
])

componentsCtrl.directive('componentForm', ['$http', ($http) ->
  return {
    restrict: 'A',
    scope: true,
    controller: ($scope, $attrs) ->
      if ($attrs.componentForm == '0')
        console.log('new component');
      else
        console.log('old component');

    link: (scope, element, attrs) ->
  }
])
