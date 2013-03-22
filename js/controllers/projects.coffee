window.ProjectsCtrl = (scope, projects, win, routeParams, location) ->
	# do not filter initially
	scope.search =
		skill: routeParams.skill || ''

	scope.projects = projects.query()

	scope.$watch 'search.skill', ->
		location.search('skill', if scope.search.skill.length > 0 then scope.search.skill else null)

window.ProjectsCtrl.$inject = ['$scope', 'Projects', '$window', '$routeParams', '$location']