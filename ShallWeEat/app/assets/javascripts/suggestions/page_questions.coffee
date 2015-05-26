$(".suggestions.questions").ready ->
	$(document).ready ->
		initialize()

	questions = []
	answers = []
	cnt = 0

	initialize = () ->
		$.ajax
			url: '/suggestions/get_questions'
			type: 'get'
			success: (data) ->
				if data.st == 0
					questions = data.questions
					answers = new Array(questions.length)
					show_question()
		window.cnt = 0

		$("#button_back").click ->
			go_back()
		$("#button_1").click ->
			save_answer(1)
		$("#button_2").click ->
			save_answer(2)
		$("#button_3").click ->
			save_answer(3)
		$("#button_4").click ->
			save_answer(4)
		$("#button_5").click ->
			save_answer(5)
	
	show_question = () ->
		$("#text_question").text(questions[cnt])

	save_answer = (answer) ->
		answers[cnt] = answer
		cnt += 1
		if cnt == questions.length
			window.location.replace("/suggestions/get_suggestions?"+$.param({user_answers:answers}))
		else
			show_question()

	go_back = () ->
		cnt -= 1
		show_question()
