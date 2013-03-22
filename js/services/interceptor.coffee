dateStr2date = (dateStr) ->
	return if dateStr then new Date(dateStr) else null

angular.module('CV').factory 'ResponseConverter', ['$q', (q) ->
	return (promise) ->
		return promise.then (response) ->
			# do something on success
			switch(response.config.url)
				when '/api/projects.json', '/api/jobs.json', '/api/education.json'
					for obj in response.data
						obj.start = dateStr2date(obj.start)
						obj.finish = dateStr2date(obj.finish)
			response
]