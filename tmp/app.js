(function() {
  var configFn;

  configFn = function(routeProvider) {
    return routeProvider.when('/', {
      templateUrl: 'partials/index.html'
    }).when('/jobs', {
      controller: 'JobsCtrl',
      templateUrl: 'partials/jobs.html',
      reloadOnSearch: false
    }).otherwise({
      controller: 'NotFoundCtrl',
      templateUrl: 'partials/404.html'
    });
  };

  configFn.$inject = ['$routeProvider'];

  window.app = angular.module('CV', ['ngResource']).config(configFn);

}).call(this);

(function() {

  window.JobsCtrl = function(scope, jobs, win, routeParams, location) {
    scope.searchSkill = routeParams.skill || '';
    scope.jobs = jobs.query();
    return scope.$watch('searchSkill', function() {
      return location.search('skill', scope.searchSkill.length > 0 ? scope.searchSkill : null);
    });
  };

  window.JobsCtrl.$inject = ['$scope', 'Jobs', '$window', '$routeParams', '$location'];

}).call(this);

(function() {

  window.NotFoundCtrl = function() {};

}).call(this);

(function() {

  window.app.filter('howLong', function() {
    return function(start, finish) {
      var months, monthsDiff, years;
      start = new Date(start);
      finish = finish !== null ? new Date(finish) : new Date();
      monthsDiff = finish.getFullYear() * 12 + finish.getMonth() - start.getFullYear() * 12 - start.getMonth();
      years = Math.floor(monthsDiff / 12);
      months = monthsDiff - years * 12;
      return (years !== 0 ? years + ' year' + (years === 1 ? '' : 's') : '') + (years !== 0 ? ' ' : '') + (months !== 0 ? months + ' month' + (months === 1 ? '' : 's') : '');
    };
  });

}).call(this);

(function() {

  angular.module('CV').factory('Jobs', [
    '$resource', function(resource) {
      return resource('api/jobs.json', {}, {
        query: {
          method: 'GET',
          isArray: true
        }
      });
    }
  ]);

}).call(this);
