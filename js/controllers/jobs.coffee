window.app.controller 'JobsCtrl', ['$scope', 'Jobs', '$window', '$routeParams', '$location', 'tracker', ($scope, jobs, $window, $routeParams, $location, tracker) ->
	# do not filter initially
	$scope.search = skill: $routeParams.skill || ''
	$scope.jobs = jobs.query()
	$scope.$watch 'search.skill', ->
		tracker.event 'jobs', 'skill', 'Filter by skill', $scope.search.skill
		$location.search('skill', if $scope.search.skill.length > 0 then $scope.search.skill else null)
]
