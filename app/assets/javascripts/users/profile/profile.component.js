angular.
    module('user.profile').
    component('profileView', {
        templateUrl: 'users/profile/profile.template.html',
        controller: [
            '$scope',
            'dataService',
            function ($scope, dataService) {
                dataService.get('/users.json').then(function(users){
                    $scope.users = users.data
                })
            }
        ]
});
