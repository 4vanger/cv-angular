angular.module('CV').directive 'skill', ->
	restrict: 'E'
	scope:
		skill: '=data'
		search: '='
	templateUrl: 'partials/skill.html'
	replace: true