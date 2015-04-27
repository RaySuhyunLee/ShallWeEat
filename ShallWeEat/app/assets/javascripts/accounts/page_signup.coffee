$('.accounts.signup').ready ->
	$(document).ready ->
		initialize()

	initialize = () ->
		$('#new_account').on('ajax:success', (e, data) ->
			if data.st == 0
				window.location.replace('/accounts/index')
			else if data.st == -1
				msg = data.msg
				$('#error_msg_box').text(msg)
			if not data.st?
				doc = document.open('text/html', 'replace')
				doc.write(data)
				doc.close()
		)

