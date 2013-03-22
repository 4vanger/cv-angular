window.app.filter 'sort', ->
	(array, reverse) ->
		return '' unless array
		array = angular.copy(array).sort()
		array = array.reverse() if reverse
		array
