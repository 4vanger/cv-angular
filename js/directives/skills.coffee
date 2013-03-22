angular.module('CV').directive 'skills', ->
	restrict: 'E'
	scope:
		skills: '=data'
		search: '='
	replace: true
	templateUrl: 'partials/skills.html'