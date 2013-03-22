angular.module('CV').directive 'project', ->
	restrict: 'E'
	scope:
		project: '=data'
		search: '='
	templateUrl: 'partials/project.html'
	replace: true
