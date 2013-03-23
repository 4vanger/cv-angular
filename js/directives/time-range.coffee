angular.module('CV').directive 'timeRange', ['$filter', (filter) ->
	restrict: 'E'
	templateUrl: 'partials/time-range.html'
	scope:
		start: '='
		finish: '='
		dateFormat: '@'
	link: (scope, el, attrs) ->
		scope.dateFormat = 'MMMM yy' unless scope.dateFormat
		scope.showTitle = true unless attrs.showTitle?
		scope.showCurrent = true unless attrs.showCurrent?
		scope.title = filter('howLong')(scope.start, scope.finish) if scope.showTitle
]
