window.app.filter 'howLong', ->
	(start, finish) ->
		start = new Date(start);
		finish = if finish != null then new Date(finish) else new Date()
		monthsDiff = finish.getFullYear() * 12 + finish.getMonth() - start.getFullYear() * 12 - start.getMonth();
		years = Math.floor(monthsDiff/12);
		months = monthsDiff - years * 12;
		(
			if years != 0
				years + ' year' + (if years == 1 then '' else 's')
			else
				''
		) + (
			if years != 0
				' '
			else ''
		) + (
			if months != 0
				months + ' month' + (if months == 1 then '' else 's')
			else ''
		)

