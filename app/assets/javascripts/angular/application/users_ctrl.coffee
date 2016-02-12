appModule.controller('usersCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get("/#{window.locale}/users.json")
  .success((response) ->
    $scope.users = response.users
  )
])
