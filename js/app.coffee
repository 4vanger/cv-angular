window.app = angular.module('CV', ['ngResource'])
	.config(['$routeProvider', '$httpProvider', (routeProvider, httpProvider) ->
		routeProvider
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
				controller: 'NotFoundCtrl'
				templateUrl: 'partials/404.html'

		httpProvider.responseInterceptors.push('ResponseConverter')
	])
	.run(['$rootScope', '$location', '$window', (rootScope, location, win) ->
		win._gaq = win._gaq || []
		win._gaq.push(['_setAccount', 'UA-149419-2'])
		win._gaq.push(['_trackPageview'])
		ga = document.createElement('script')
		ga.type = 'text/javascript'
		ga.async = true
		ga.src = (if 'https:' == document.location.protocol then 'https://ssl' else 'http://www') + '.google-analytics.com/ga.js'
		s = document.getElementsByTagName('script')[0]
		s.parentNode.insertBefore(ga, s)

		rootScope.$on '$viewContentLoaded', ->
			win._gaq.push(['_trackPageview', location.$$absUrl.replace(/[^\/]*\/\/[^\/]*/, '')]);
	])
