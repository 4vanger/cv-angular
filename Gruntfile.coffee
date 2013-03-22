module.exports = (grunt) ->
	# Project configuration.
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-angular-templates'

	grunt.initConfig(
		copy:
			'static':
				files: [
					expand: true
					cwd: 'static/'
					src: ['**'],
					dest: 'dist/'
				]
			'partials':
				files: [
					expand: true
					cwd: 'partials/'
					src: ['**'],
					dest: 'dist/partials'
				]
		concat:
			vendor:
				src: [
					'js/vendor/angular/angular.js'
					'js/vendor/angular/angular-resource.js'
				]
				dest: 'dist/vendor.js'
			app:
				src: [
					'tmp/app.js'
					'tmp/templates.js'
					'js/*.js'
					'js/directives/**/*.js'
					'js/controllers/**/*.js'
					'js/filters/**/*.js'
					'js/services/**/*.js'
				]
				dest: 'dist/app.js'
		coffee:
			assets:
				dest: 'tmp/app.js'
				src: [
					'js/app.coffee'
					'js/directives/**/*.coffee'
					'js/controllers/**/*.coffee'
					'js/filters/**/*.coffee'
					'js/services/**/*.coffee'
				]
				filter: 'isFile'
		ngtemplates:
			CV:
				src: [ 'partials/**/*.html' ]
				dest: 'tmp/templates.js'
		less:
			dev:
				options: {paths: ['./less']}
				files: 
					"dist/css.css": ['less/main.less']
			production: 
				options: 
					paths: ['./less']
					yuicompress: true
				files:
					"dist/css.css": ['less/main.less']
		uglify:
			js:
				src: [
					'<config:concat.vendor.dest>'
					'<config:concat.app.dest>'
				],
				dest: 'dist/js.min.js'
		watch:
			js:
				files: [
					'js/**/**/*.coffee'
					'js/**/*.js'
				]
				tasks: ['coffee', 'concat']
			less:
				files: ['less/**/*']
				tasks: ['less:dev']
			resources:
				files: ['static/**/*']
				tasks: ['copy']
			template:
				files: ['partials/**/*.html']
				tasks: ['ngtemplates', 'concat:app']

	)
	grunt.registerTask('default', ['copy', 'coffee', 'ngtemplates', 'concat', 'less:dev'])
	grunt.registerTask('production', ['copy', 'coffee', 'ngtemplates', 'concat', 'less:production', 'uglify'])
