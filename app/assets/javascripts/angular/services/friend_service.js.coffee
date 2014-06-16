Gifster.factory "Friend", ($http, $q) ->
  self = {}

  self.save = (user_id, email) ->
    deferred = $q.defer()
    $http({method: "POST", url: "/users/#{user_id}/friends", data: email})
      .success (response) ->
        deferred.resolve(response)

  self.delete = (user_id, friend_id) ->
    deferred = $q.defer()
    $http({method: "DELETE", url: "/users/#{user_id}/friends/#{friend_id}"})
      .success (response) ->
        deferred.resolve(response)

  self