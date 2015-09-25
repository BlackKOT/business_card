application = angular.module('application')
application.controller('commentsCtrl', ['$scope', '$http', ($scope, $http) ->
  $http
  .get('/comments.json')
  .success((response) ->
    $scope.comments = response.comments
  )
])

application.directive 'commentForm', ['$FormService', ($FormService) ->
  {
  restrict: 'A'
  scope: true
  templateUrl: 'comments/comment'
  controller: ($scope, $attrs) ->
    if $attrs.commentForm == '0'
      console.log 'new post'
    else
      console.log 'old post'

  link: (scope, element, attrs) ->
    scope.submit = ($event) ->
      $event.preventDefault()
      $FormService.clearErrors(element)
      result = $FormService.submit(element)
      result.success =>
        $('#commentModal').modal('hide')

      result.error (data) =>
        $FormService.displayErrors(element, data)
  }
]
