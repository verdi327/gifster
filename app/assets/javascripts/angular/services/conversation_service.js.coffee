Gifster.factory "Conversation", ($http, $q) ->
  self = {}

  self.index = () ->
    deferred = $q.defer()
    $http({method: 'GET', url: "/users"})
      .success (users) ->
        deferred.resolve(users)

    deferred.promise

  # TODO: link these correctly
  self.save = (user_id, friends) ->
    deferred = $q.defer()
    $http({method: "POST", url: "/users/#{user_id}/conversations", data: friends})
      .success (response) ->
        deferred.resolve(response)

  self.delete = (user_id, id) ->
    deferred = $q.defer()
    $http({method: "DELETE", url: "/users/#{user_id}/conversation/#{id}"})
      .success (response) ->
        deferred.resolve(response)

  self