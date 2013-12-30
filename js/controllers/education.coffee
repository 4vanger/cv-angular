window.app.controller 'EducationCtrl', ['$scope', 'Educations', ($scope, educations)->
	$scope.educations = educations.query()
]
