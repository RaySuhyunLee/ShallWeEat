$(".suggestions.questions").ready ->
	$(document).ready ->
		initialize()

	questions = []
	answers = []
	cnt = 0
	food_index = 0
	food_results = []

	initialize = () ->
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
		$("#button_good").click ->
			like()
		$("#button_bad").click ->
			dislike()

		show_question_view()
	
	show_question = () ->
		$("#text_question").text(questions[cnt])

	save_answer = (answer) ->
		answers[cnt] = answer
		cnt += 1
		if cnt == questions.length
			show_food_result_view()
		else
			show_question()

	go_back = () ->
		if cnt > 0
			cnt -= 1
			show_question()

	show_question_view = () ->
		$("#question_view").css('display', 'initial')
		$("#food_result_view").css('display', 'none')

		$.ajax
			url: '/suggestions/get_questions'
			type: 'get'
			success: (data) ->
				if data.st == 0
					cnt = 0
					questions = data.questions
					answers = new Array(questions.length)
					show_question()

	show_food_result_view = () ->
		$.ajax
			url: '/suggestions/get_suggestions'
			data:
				user_answers: answers
			success: (data) ->
				if data.st == 0
					food_results = data.food_results
					show_food_info()

		$("#question_view").css('display', 'none')
		$("#food_result_view").css('display', 'initial')
		food_index = 0
		
	show_food_info = () ->
		food = food_results[food_index]
		$("#food_name").text(food.name)
		#$("#food_desc").text = food.desc
		$("#food_img").attr('src', food.img)

	show_restaurant = () ->
		alert("hello")
	
	like = () ->
		$.ajax
			type: 'post'
			url: '/suggestions/feedback'
			data:
				is_good: 1
				user_answers: answers
				food_data: food_results[food_index].data
			success: (data) ->
				if data.st == 0
					window.location.replace('/suggestions/questions')
	
	dislike = () ->
		food_index += 1
		show_food_info()
