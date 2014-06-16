Gifster.controller "FriendsController", ($scope, Friend) ->

  $scope.save = () ->
    Friend.save($scope.user_id, $scope.friend)
      .then (response) ->
        $scope.friend = {}
        $scope.friends.push(response.data)

  $scope.delete = (friend, index) ->
    Friend.delete($scope.user_id, friend.id)
      .then (response) ->
        $scope.friends.splice(index, 1)
        $scope.friend = {}
