window.JobsCtrl = (scope, jobs, win, routeParams, location) ->
	# do not filter initially
	scope.search =
		skill: routeParams.skill || ''
	scope.jobs = jobs.query()
	scope.$watch 'search.skill', ->
		location.search('skill', if scope.search.skill.length > 0 then scope.search.skill else null)

window.JobsCtrl.$inject = ['$scope', 'Jobs', '$window', '$routeParams', '$location']