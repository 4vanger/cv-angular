angular.module('CV').directive 'job', ->
	restrict: 'E'
	scope:
		job: '=data'
		search: '='
	templateUrl: 'partials/job.html'
	replace: true