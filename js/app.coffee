window.app = angular.module('CV', ['ngResource', 'ga-tracker'])
	.config(['$routeProvider', '$httpProvider', 'trackerProvider', ($routeProvider, $httpProvider, trackerProvider) ->
		$routeProvider
			.when '/',
				templateUrl: 'partials/index.html'
			.when '/jobs',
				controller: 'JobsCtrl'
				templateUrl: 'partials/jobs.html'
				reloadOnSearch: false
			.when '/jobs/:jobId',
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
				templateUrl: 'partials/404.html'
		trackerProvider.start 'UA-149419-2'
		$httpProvider.responseInterceptors.push('ResponseConverter')
	])
	.run(['$rootScope', '$location', 'tracker', ($rootScope, $location, tracker) ->
		$rootScope.$on '$viewContentLoaded', -> tracker.pageView $location.$$absUrl.replace(/[^\/]*\/\/[^\/]*/, '')
	])
