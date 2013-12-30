angular.module('CV').factory 'Projects', ['$resource', ($resource) ->
	$resource 'api/projects.json'
]
