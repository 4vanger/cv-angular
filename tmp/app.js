(function() {
  var configFn;

  configFn = function(routeProvider) {
    return routeProvider.when('/', {
      controller: 'IndexCtrl',
      templateUrl: 'partials/index.html'
    }).otherwise({
      controller: 'NotFoundCtrl',
      templateUrl: 'partials/404.html'
    });
  };

  configFn.$inject = ['$routeProvider'];

  window.app = angular.module('CV', []).config(configFn);

}).call(this);

(function() {

  window.DashboardCtrl = function(location) {};

  window.DashboardCtrl.$inject = ['$location'];

}).call(this);

(function() {

  window.NotFoundCtrl = function() {};

}).call(this);
