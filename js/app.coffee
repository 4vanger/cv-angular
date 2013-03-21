configFn = (routeProvider) ->
	routeProvider
		.when '/',
			templateUrl: 'partials/index.html'
		.when '/jobs',
			controller: 'JobsCtrl'
			templateUrl: 'partials/jobs.html'
			reloadOnSearch: false
		.otherwise
			controller: 'NotFoundCtrl'
			templateUrl: 'partials/404.html'

configFn.$inject = ['$routeProvider']

window.app = angular.module('CV', ['ngResource'])
	.config(configFn)
