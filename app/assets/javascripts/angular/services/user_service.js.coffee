Gifster.factory "User", ($http, $q) ->
  self = {}

  self.index = () ->
    deferred = $q.defer()
    $http({method: 'GET', url: "/users"})
      .success (users) ->
        deferred.resolve(users)

    deferred.promise

  self.save = (user) ->
    deferred = $q.defer()
    $http({method: "POST", url: "/users", data: user})
      .success (response) ->
        deferred.resolve(response)

  self.edit = (user) ->
    deferred = $q.defer()
    $http({method: "PUT", url: "/users/#{user.id}", data: user})
      .success (response) ->
        deferred.resolve(response)

  self.delete = (id) ->
    deferred = $q.defer()
    $http({method: "DELETE", url: "/users/#{id}"})
      .success (response) ->
        deferred.resolve(response)

  self