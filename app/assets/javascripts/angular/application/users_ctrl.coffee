appModule.controller('usersCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get('/users.json')
  .success((response) ->
    $scope.users = response.users
  )
])
