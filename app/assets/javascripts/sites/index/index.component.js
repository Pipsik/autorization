angular.
    module('site.index').
    component('sitesView', {
        templateUrl: 'sites/index/index.template.html',
        controller: [
            '$scope',
            'sites',
            function ($scope, sites) {

                $scope.sites_url = '/sites.json';   

                sites.getAll().then(function(sites) {
                  $scope.sites = sites.data;
                    });

                }
        ]
});