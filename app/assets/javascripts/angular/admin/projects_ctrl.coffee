appModule.controller('projectsCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get('/admin/projects.json')
  .success((response) ->
    $scope.projects = response.projects
  )
])
