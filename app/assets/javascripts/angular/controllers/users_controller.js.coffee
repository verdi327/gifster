Gifster.controller "UsersController", ($scope, User) ->
  newFormHeader = "Add New User"
  $scope.formHeader = newFormHeader
  $scope.getUsers = () ->
    User.index()
      .then (users) ->
        $scope.users = users

  $scope.save = () ->
    if $scope.user.id?
      console.log($scope.user)
      User.edit($scope.user)
        .then (response) ->
          $scope.users[$scope.user.index] = response.data
          $scope.user = {}
          $scope.formHeader = newFormHeader
    else
      User.save($scope.user)
        .then (response) ->
          $scope.user = {}
          $scope.users.push(response.data)

  $scope.edit = (user, index) ->
    $scope.formHeader = "Edit User"
    $scope.user =
      id: user.id
      first_name: user.first_name
      last_name: user.last_name
      email: user.email
      index: index

  $scope.delete = (user, index) ->
    User.delete(user.id)
      .then (response) ->
        $scope.users.splice(index, 1)
        $scope.user = {}
        $scope.formHeader = newFormHeader
