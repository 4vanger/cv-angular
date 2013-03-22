window.EducationCtrl = (scope, educations)->
	scope.educations = educations.query()

window.EducationCtrl.$inject = ['$scope', 'Educations']