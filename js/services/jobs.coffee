angular.module('CV').factory 'Jobs', ['$resource', ($resource) ->
	$resource 'api/jobs.json'
]
