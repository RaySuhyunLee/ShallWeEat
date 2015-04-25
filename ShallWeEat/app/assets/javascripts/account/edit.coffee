$(document).ready ->
	initialize()
initialize = () ->
	$('#button_change_password').click ->
		sendEditPasswordRequest()

sendEditPasswordRequest = () ->
	$.ajax
		url: '/account/edit_password'
		type: 'post'
		data:
			pass_old: $('#input_pass_old').val()
			pass_new: $('#input_pass_new').val()
		success: (data) ->
			if data.st == 0
				alert('success!')
			else
				alert('fail')
		error: ->
		dataType: 'json'
