$(".suggestions.questions").ready ->
	$(document).ready ->
		initialize()

	initialize = () ->
		$.ajax
			url: '/suggestions/get_questions'
			type: 'get'
			success: (data) ->
				if data.st == 0
					window.questions = data.questions
					window.answers = new Array(window.questions.length)
					show_question()
		window.cnt = 0


		$("#button_back").click ->
			go_back()
		$("#button_0").click ->
			save_answer(0)
		$("#button_1").click ->
			save_answer(1)
		$("#button_2").click ->
			save_answer(2)
		$("#button_3").click ->
			save_answer(3)
		$("#button_4").click ->
			save_answer(4)
	
	show_question = () ->
		$("#text_question").text(window.questions[window.cnt])

	save_answer = (answer) ->
		window.answers[window.cnt] = answer
		window.cnt += 1
		if window.cnt == window.questions.length
			window.location.replace("/suggestions/get_suggestion?"+$.param({user_answers:window.answers}))
		else
			show_question()

	go_back = () ->
		window.answers -= 1
		show_question()
