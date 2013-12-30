angular.module('ga-tracker', []).provider('tracker',
	start: (key) ->
		win = window
		doc = document
		win._gaq = win._gaq || []
		win._gaq.push(['_setAccount', key])
		win._gaq.push(['_trackPageview'])
		ga = doc.createElement('script')
		ga.type = 'text/javascript'
		ga.async = true
		ga.src = (if 'https:' == doc.location.protocol then 'https://ssl' else 'http://www') + '.google-analytics.com/ga.js'
		s = doc.getElementsByTagName('script')[0]
		s.parentNode.insertBefore(ga, s)
	$get: ->
		pageView: (url) -> window._gaq.push(['_trackPageview', url]);
		event: (category, action, label, value, nonInteraction) -> window._gaq.push(['_trackEvent', category, action, label, value, nonInteraction])

)
