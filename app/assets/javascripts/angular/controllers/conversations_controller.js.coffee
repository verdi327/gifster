Gifster.controller "ConversationsController", ($scope, Conversation) ->

  $scope.save = () ->
    Conversation.save($scope.user_id, $scope.friends)
      .then (response) ->
        $scope.conversation = {}
        $scope.conversations.push(response.data)

  $scope.delete = (conversation, index) ->
    Conversation.delete(conversation.id)
      .then (response) ->
        $scope.conversations.splice(index, 1)
        $scope.conversation = {}
