configFn = (routeProvider) ->
	routeProvider
		.when '/',
			controller: 'IndexCtrl'
			templateUrl: 'partials/index.html'
		.otherwise
			controller: 'NotFoundCtrl'
			templateUrl: 'partials/404.html'

configFn.$inject = ['$routeProvider']

window.app = angular.module('CV', [])
	.config(configFn)
