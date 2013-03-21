window.JobsCtrl = (scope, jobs, win, routeParams, location) ->
	# do not filter initially
	scope.searchSkill = routeParams.skill || ''
	scope.jobs = jobs.query()
	scope.$watch 'searchSkill', ->
		location.search('skill', if scope.searchSkill.length > 0 then scope.searchSkill else null)

window.JobsCtrl.$inject = ['$scope', 'Jobs', '$window', '$routeParams', '$location']