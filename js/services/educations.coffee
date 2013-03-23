angular.module('CV').factory 'Educations', ['$resource', (resource) ->
	resource 'api/education.json', {},
		query:
			method: 'GET'
			isArray: true
]
