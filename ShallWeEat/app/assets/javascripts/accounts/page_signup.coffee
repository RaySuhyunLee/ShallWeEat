$('.accounts.signup').ready ->
	$(document).ready ->
		initialize()

	initialize = () ->
		$('#new_account').on('ajax:success', (e, data) ->
			if not data.st?
				doc = document.open('text/html', 'replace')
				doc.write(data)
				doc.close()
		)

