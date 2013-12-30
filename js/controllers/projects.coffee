window.app.controller 'ProjectsCtrl', ['$scope', 'Projects', '$window', '$routeParams', '$location', '$filter', 'tracker', ($scope, projects, $window, $routeParams, $location, $filter, tracker) ->
	# do not filter initially
	$scope.search =
		skill: $routeParams.skill || ''
		fulltimeProjects: $routeParams.fulltime || true
		petProjects: $routeParams.pet || true

	$scope.filterByType = (project) ->
		project.type == 'pet' && $scope.search.petProjects ||
		project.type == 'fulltime' && $scope.search.fulltimeProjects

	$scope.resetSearch = ->
		$scope.search.skill = ''
		$scope.search.fulltimeProjects = true
		$scope.search.petProjects = true

	$scope.allProjects = projects.query()
	$scope.filteredProjects = ->
		arr = $filter('filter')($scope.allProjects, {skills: $scope.search.skill})
		arr = $filter('filter')(arr, $scope.filterByType)
		arr = $filter('orderBy')(arr, '-start')
		arr

	$scope.$watch 'search.skill', -> tracker.event 'Projects', 'Filter', 'Skill changed', $scope.search.skill
	$scope.$watch 'search.fulltimeProjects', -> tracker.event 'Projects', 'Filter', 'Fulltime projects', $scope.search.fulltimeProjects
	$scope.$watch 'search.petProjects', -> tracker.event 'Projects', 'Filter', 'Pet projects', $scope.search.petProjects

	# only when any of filter changes
	$scope.$watch 'search.skill + search.fulltimeProjects + search.petProjects', ->
		obj = {}
		obj.skill = $scope.search.skill if $scope.search.skill.length > 0
		bothEnabled = $scope.search.fulltimeProjects && $scope.search.petProjects
		obj.fulltime = true if $scope.search.fulltimeProjects && !bothEnabled
		obj.pet = true if $scope.search.petProjects && !bothEnabled

		$location.search(obj)
]
