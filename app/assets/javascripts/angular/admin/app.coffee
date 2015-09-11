admin = angular.module('admin',[])

admin.controller('usersCtrl', ($scope, $http) ->
  $http
    .get('/admin/users.json')
    .success((response) ->
      $scope.users = response.users
    )
)
