angular.module('admin').controller('projectsCtrl', ($scope, $http) ->
  $http
  .get('/admin/projects.json')
  .success((response) ->
    $scope.projects = response.projects
  )
)
