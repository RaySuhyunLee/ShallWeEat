$(".suggestions.questions").ready ->
	$(document).ready ->
		initialize()

	questions = []
	answers = []
	cnt = 0
	food_index = 0
	food_results = []
	restaurants = []
	map = null
	label = null
	infoWindow = null

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
					# a set of sets of restaurants
					restaurants = data.restaurants
					show_food_info()
					if restaurants != null && restaurants.length > 0
						draw_map(get_restaurants())
					else
						alert('no restaurants!')

		$("#question_view").css('display', 'none')
		$("#food_result_view").css('display', 'initial')
		food_index = 0
		
	show_food_info = () ->
		food = food_results[food_index]
		$("#food_name").text(food.name)
		$("#food_img").attr('src', food.img)

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
					alert("Thank You! :D")
					window.location.replace('/suggestions/questions')
	
	dislike = () ->
		food_index += 1
		if (food_index < food_results.length)
			show_food_info()
			draw_map(get_restaurants())
		else
			food_index -= 1
			alert("먹을게 없다면 다이어트를 하는것도 좋은 방ㅂ... :(")

	get_restaurants = () ->
		restaurants[food_index]

	draw_map = (restaurants) ->
		# initialize map if first time
		if map == null
			init_map()
		else
			map.clearOverlay()
			map.addOverlay(label)
			map.addOverlay(infoWindow)

		# get coordinates from the restaurant data
		coors = $.map(restaurants, (e, idx) ->
				new nhn.api.map.TM128(e.mapx, e.mapy)
		)
		oOffset = new nhn.api.map.Size(14, 37)
		oSize = new nhn.api.map.Size(28, 37)
		icon = new nhn.api.map.Icon("http://static.naver.com/maps2/icons/pin_spot2.png", oSize, oOffset)
		
		# set boundray so that all coors would displayed in the map
		map.setBound(coors)
		
		# mark restaurants
		for i in [0..restaurants.length-1]
			title = restaurants[i].title
			marker = new nhn.api.map.Marker(icon, {
				point: coors[i]
				zIndex: i
				title: title
			})
			map.addOverlay(marker)


	init_map = () ->
		map = new nhn.api.map.Map("map", {
			minMaxLevel: [1, 14]
			size: new nhn.api.map.Size(800, 600)
		})

		label = new nhn.api.map.MarkerLabel()

		infoWindow = new nhn.api.map.InfoWindow()
		infoWindow.setVisible(false)

		map.addOverlay(label)
		map.addOverlay(infoWindow)

		map.attach('mouseenter', (event) ->
			target = event.target
			if target instanceof nhn.api.map.Marker
				label.setVisible(true, target)
		)

		map.attach('mouseleave', (event) ->
			target = event.target
			if target instanceof nhn.api.map.Marker
				label.setVisible(false)
		)

		map.attach('click', (event) ->
			point = event.point
			target = event.target
			infoWindow.setVisible(false)

			if target instanceof nhn.api.map.Marker
				if event.clickCoveredMarker
					return

				restaurant = get_restaurants()[target.getZIndex()]
				
				infoWindow.setContent(
					'<div class="breadcrumb" style="border: 1px solid #707070; width: 300px !important; height: auto;">'+
						'<span style="width: 260px; display: inline-block;">'+
							'<h4 style="font-weight: bold;">'+target.getTitle()+'</h4>'+
							'<div style="background-color: black; height: 2px;"></div>'+
							'<div style="margin-top: 10px;">'+
								'<p>'+restaurant.roadAddress+'</p>'+
								'<p style="display: inline;">'+restaurant.telephone+' | </p>'+
								'<p style="display: inline;">'+restaurant.category+'</p>'+
								'<p>'+restaurant.description+'</p>'+
							'</div>'+
						'</span>'+
					'</div>')
				infoWindow.setPoint(target.getPoint())
				infoWindow.setPosition(right: 15, top: 30)
				infoWindow.setVisible(true)
				infoWindow.autoPosition()
		)

