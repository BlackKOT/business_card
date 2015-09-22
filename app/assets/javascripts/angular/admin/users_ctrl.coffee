angular.module('admin').controller('usersCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get('/admin/users.json')
  .success((response) ->
    $scope.users = response.users
  )
])
