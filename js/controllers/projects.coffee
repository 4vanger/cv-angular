window.ProjectsCtrl = (scope, projects, win, routeParams, location, filter) ->
	# do not filter initially
	scope.search =
		skill: routeParams.skill || ''
		fulltimeProjects: routeParams.fulltime || true
		petProjects: routeParams.pet || true

	scope.filterByType = (project) ->
		project.type == 'pet' && scope.search.petProjects ||
		project.type == 'fulltime' && scope.search.fulltimeProjects

	scope.resetSearch = ->
		scope.search.skill = ''
		scope.search.fulltimeProjects = true
		scope.search.petProjects = true

	scope.projects = projects.query()

	# only when any of filter changes
	scope.$watch 'search.skill + search.fulltimeProjects + search.petProjects', ->
		obj = {}
		obj.skill = scope.search.skill if scope.search.skill.length > 0
		bothEnabled = scope.search.fulltimeProjects && scope.search.petProjects
		obj.fulltime = true if scope.search.fulltimeProjects && !bothEnabled
		obj.pet = true if scope.search.petProjects && !bothEnabled

		location.search(obj)

window.ProjectsCtrl.$inject = ['$scope', 'Projects', '$window', '$routeParams', '$location', '$filter']