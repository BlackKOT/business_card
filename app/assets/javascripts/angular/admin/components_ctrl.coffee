angular.module('admin').controller('componentsCtrl', ($scope, $http) ->
  $http
  .get('/admin/components.json')
  .success((response) ->
    $scope.components = response.components
  )
)
