$(document).ready ->
	initialize()
initialize = () ->
	$('#button_edit_password').click ->
		sendEditPasswordRequest()
	$('#button_edit_profile').click ->
		sendEditProfileRequest()


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

sendEditProfileRequest = () ->
	$.ajax
		url: '/account/edit_profile'
		type: 'post'
		data:
			email: $('#input_email').val()
			gender: $('input:radio[name=gender]:checked').val()
			birth: $('#input_birth').val()
		success: (data) ->
			if data.st == 0
				alert('success!')
			else
				alert('fail')
		error: ->
		dataType: 'json'
