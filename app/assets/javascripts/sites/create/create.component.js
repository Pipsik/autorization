angular.module('site.create').
component('createView', {
  templateUrl: 'sites/create/create.template.html',
  controller: [
  '$scope',
  'dataService',

  function ($scope, dataService) {
    $scope.addSite = function(){
      var o = { site: {
          name: $scope.name,
          description: $scope.description,
          tags: $scope.tags
        }
      };

      dataService.post('/return', o).then(function(ob) { alert(ob);});
    }
  }]
});