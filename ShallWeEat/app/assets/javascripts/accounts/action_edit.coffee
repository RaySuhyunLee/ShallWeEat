$(".accounts.edit").ready ->
	$(document).ready ->
		initialize()
	initialize = () ->
		$('#button_edit_password').click ->
			sendEditPasswordRequest()
		$('#button_edit_profile').click ->
			sendEditProfileRequest()

	sendEditPasswordRequest = () ->
		# check if pass_new and pass_confirm are same
		if $('#input_pass_new').val() != $('#input_pass_confirm').val()
			alert("New password and password confirmation doesn't match")
		else
			$.ajax
				url: '/accounts/edit_password'
				type: 'post'
				data:
					pass_old: $('#input_pass_old').val()
					pass_new: $('#input_pass_new').val()
				success: (data) ->
					if data.st == 0
						alert('Successfully changed password!')
						location.reload()
					else
						alert('Invalid password.')
				error: ->
				dataType: 'json'

	sendEditProfileRequest = () ->
		$.ajax
			url: '/accounts/edit_profile'
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
