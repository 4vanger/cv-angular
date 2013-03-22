dateStr2date = (dateStr) ->
	return if dateStr then new Date(dateStr) else null

angular.module('CV').factory 'ResponseConverter', ['$q', (q) ->
	return (promise) ->
		return promise.then (response) ->
			# do something on success
			switch(response.config.url)
				when '/api/projects.json', '/api/jobs.json'
					for obj in response.data
						obj.startTimestamp = dateStr2date(obj.startTimestamp)
						obj.finishTimestamp = dateStr2date(obj.finishTimestamp)
			response
]