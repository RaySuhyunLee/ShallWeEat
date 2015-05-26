$(".suggestions.questions").ready ->
	$(document).ready ->
		initialize()

	questions = []
	answers = []
	cnt = 0

	initialize = () ->
		$("#question_view").css('display', 'initial')
		$("#food_result_view").css('display', 'none')
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
			$.ajax
				url: '/suggestions/get_suggestions'
				data:
					user_answers: answers
				success: (data) ->
					if data.st == 0
						$("question_view").css('display', 'none')
						$("#food_result_view").css('display', 'initial')
						show_food_info(data.food_results[0])
						#window.location.replace("/suggestions/get_suggestions?"+$.param({user_answers:answers}))
		else
			show_question()

	go_back = () ->
		cnt -= 1
		show_question()

	show_food_info = (food) ->
		$("#food_name").text = food.name
		#$("#food_desc").text = food.desc
		$("#food_img").scr = food.img
