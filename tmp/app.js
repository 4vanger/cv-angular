(function() {
  var configFn;

  configFn = function(routeProvider, httpProvider) {
    routeProvider.when('/', {
      templateUrl: 'partials/index.html'
    }).when('/jobs', {
      controller: 'JobsCtrl',
      templateUrl: 'partials/jobs.html',
      reloadOnSearch: false
    }).when('/projects', {
      controller: 'ProjectsCtrl',
      templateUrl: 'partials/projects.html',
      reloadOnSearch: false
    }).otherwise({
      controller: 'NotFoundCtrl',
      templateUrl: 'partials/404.html'
    });
    return httpProvider.responseInterceptors.push('ResponseConverter');
  };

  configFn.$inject = ['$routeProvider', '$httpProvider'];

  window.app = angular.module('CV', ['ngResource']).config(configFn);

}).call(this);

(function() {

  window.JobsCtrl = function(scope, jobs, win, routeParams, location) {
    scope.search = {
      skill: routeParams.skill || ''
    };
    scope.jobs = jobs.query();
    return scope.$watch('search.skill', function() {
      return location.search('skill', scope.search.skill.length > 0 ? scope.search.skill : null);
    });
  };

  window.JobsCtrl.$inject = ['$scope', 'Jobs', '$window', '$routeParams', '$location'];

}).call(this);

(function() {

  window.NotFoundCtrl = function() {};

}).call(this);

(function() {

  window.ProjectsCtrl = function(scope, projects, win, routeParams, location) {
    scope.search = {
      skill: routeParams.skill || ''
    };
    scope.projects = projects.query();
    return scope.$watch('search.skill', function() {
      return location.search('skill', scope.search.skill.length > 0 ? scope.search.skill : null);
    });
  };

  window.ProjectsCtrl.$inject = ['$scope', 'Projects', '$window', '$routeParams', '$location'];

}).call(this);

(function() {

  window.app.filter('howLong', function() {
    return function(start, finish) {
      var months, monthsDiff, years;
      start = new Date(start);
      finish = finish != null ? new Date(finish) : new Date();
      monthsDiff = finish.getFullYear() * 12 + finish.getMonth() - start.getFullYear() * 12 - start.getMonth();
      years = Math.floor(monthsDiff / 12);
      months = monthsDiff - years * 12;
      return (years !== 0 ? years + ' year' + (years === 1 ? '' : 's') : '') + (years !== 0 ? ' ' : '') + (months !== 0 ? months + ' month' + (months === 1 ? '' : 's') : '');
    };
  });

}).call(this);

(function() {
  var dateStr2date;

  dateStr2date = function(dateStr) {
    if (dateStr) {
      return new Date(dateStr);
    } else {
      return null;
    }
  };

  angular.module('CV').factory('ResponseConverter', [
    '$q', function(q) {
      return function(promise) {
        return promise.then(function(response) {
          var obj, _i, _len, _ref;
          switch (response.config.url) {
            case '/api/projects.json':
            case '/api/jobs.json':
              _ref = response.data;
              for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                obj = _ref[_i];
                obj.startTimestamp = dateStr2date(obj.startTimestamp);
                obj.finishTimestamp = dateStr2date(obj.finishTimestamp);
              }
          }
          return response;
        });
      };
    }
  ]);

}).call(this);

(function() {

  angular.module('CV').factory('Jobs', [
    '$resource', function(resource) {
      return resource('/api/jobs.json', {}, {
        query: {
          method: 'GET',
          isArray: true
        }
      });
    }
  ]);

}).call(this);

(function() {

  angular.module('CV').factory('Projects', [
    '$resource', function(resource) {
      return resource('/api/projects.json', {}, {
        query: {
          method: 'GET',
          isArray: true
        }
      });
    }
  ]);

}).call(this);
