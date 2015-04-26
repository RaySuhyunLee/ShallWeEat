# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(".accounts.index").ready ->
	bind_ajax = () ->
		$("#login_btn").unbind("click").click ->
			$.ajax
				type: "post"
				url: "/login"
				data: {
					name: $("#name_input").val(),
					pass: $("#pass_input").val()
				}
				dataType: "json"
				success: (data, status) ->'' +
					if data["error_code"] is -4
						alert "Invalid name and password combination. Please try again."
					else
						location.reload()
					
		$("#signup_btn").unbind("click").click ->
			$.ajax
				type: "post"
				url: "/signup"
	 
				location.reload()

	$ -> bind_ajax()
	$(window).bind "page:change", bind_ajax
