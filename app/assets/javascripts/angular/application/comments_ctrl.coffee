angular.module('application').controller('commentsCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get('/comments.json')
  .success((response) ->
    $scope.comments = response.comments
  )
])
