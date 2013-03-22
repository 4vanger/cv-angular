angular.module('CV').directive 'skill', ->
	restrict: 'E'
	scope:
		skill: '=data'
		search: '='
		type: '@'
	templateUrl: 'partials/skill.html'
	replace: true