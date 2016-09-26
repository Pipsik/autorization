angular.
  module('core.site').
  factory('sites', ['$http',

        function($http){
            var o = {
                posts: []
            };
            o.getAll = function() {
                return $http.get('/sites.json').success(function(data) {
                    angular.copy(data);
                });
            };

            o.addSite = function(site) {
                return $http.post('/sites', site).then(function(result){

                    return result.data;
                });
            };

            o.get = function(id) {
                return $http.get('/posts/' + id).then(function(result){
                    return result.data;
                });
            };
            o.addComment = function(id, comment) {
                return $http.post('/posts/' + id + '/comments', comment);
            };

            return o;
        }]);