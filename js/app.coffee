configFn = (routeProvider, httpProvider) ->
	routeProvider
		.when '/',
			templateUrl: 'partials/index.html'
		.when '/jobs',
			controller: 'JobsCtrl'
			templateUrl: 'partials/jobs.html'
			reloadOnSearch: false
		.when '/projects',
			controller: 'ProjectsCtrl'
			templateUrl: 'partials/projects.html'
			reloadOnSearch: false
		.when '/education',
			controller: 'EducationCtrl'
			templateUrl: 'partials/education.html'
		.when '/contacts',
			templateUrl: 'partials/contacts.html'
		.otherwise
			controller: 'NotFoundCtrl'
			templateUrl: 'partials/404.html'

	httpProvider.responseInterceptors.push('ResponseConverter')

configFn.$inject = ['$routeProvider', '$httpProvider']

window.app = angular.module('CV', ['ngResource'])
	.config(configFn)
