angular.module('CV').factory 'Jobs', ['$resource', (resource) ->
	resource 'api/jobs.json', {},
		query:
			method:'GET'
			isArray:true
]