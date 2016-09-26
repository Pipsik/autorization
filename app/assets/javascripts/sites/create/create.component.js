angular.module('site.create').
component('createView', {
  templateUrl: 'sites/create/create.template.html',
  controller: [
                '$scope',
                '$state',
                'sites',

    function ($scope, sites) {


      $scope.addSite = function(){
          sites.addSite({site: {
              name: $scope.name,
              description: $scope.description,
              tags: $scope.tags
          }}).then(function (errors) {
                    if(errors.id){
                        $state.go('sites');
                    }
              

                });}
      }
    ]
});