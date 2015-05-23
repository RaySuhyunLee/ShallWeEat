require_relative './ann_helper'

class SuggestionsController < ApplicationController

	def index

	end

#	def show
		
#	end

	def get_questions
		#name = session[:name]
		#if name.nil?
		#	redirect_to :accounts_index
		#else 
			#take each of the 4 answers
			#append the 4 answers in an array of answers

			#params[:radio_buttons]	
			#else	  
			#end
			questions = [
				'Are you starving to death?',
				'Do you lack money?',
				'How are you today?',
				'Are you busy?'
			]
			status = 0
			render :json => {:st => status, :questions => questions}
		#end

	end

	def get_suggestions
		user_answers = params[:user_answers]

		ann_inputs = answers_to_ann(answers)
		db_inputs = ann_to_db(run_ann(ann_inputs))
		print(ann_inputs)

		session[:user_answers] = user_answers # store answer data in session
		session[:db_inputs] = db_inputs 
		#search_food(db_inputs, 0)
		render plain: converted.inspect
	end

	#def submit
	#	redirect_to :suggestions_get_suggestion
	#end

	def search_food(input_list, rank)
		def abs(number)
			if(number > 0)
				number
			else
				-number
			end
		end

		@i = 0
		@answer = []

		Food.all.each do |food|
			difference_value = 
				abs(food.spicy - input_list[0]) + 
				abs(food.sour - input_list[1]) + 
				abs(food.sweet - input_list[2]) + 
				abs(food.salty - input_list[3]) + 
				abs(food.bitter - input_list[4]) + 
				abs(food.hot - input_list[5]) + 
				abs(food.cold - input_list[6]) + 
				abs(food.calories - input_list[7]) + 
				abs(food.time - input_list[8]) + 
				abs(food.price - input_list[9])

			@answer[@i] = [difference_value,(@i+1)] 
			@i = @i + 1
		end
		
		@answer = @answer.sort

		#rank = 1 -> most appropriate food
		
		food_answer = Food.find(@answer[rank - 1][1]) 
	
		name = food_answer.name #name is food'name
		image_src = food_answer.image #image_src is string that food image route

		
			return [name, image_src]
	end

	def feedback
		is_good = params[:is_good]
		cur_rank = params[:cur_rank]
		ann_inputs = answers_to_ann(session[:user_answers])
		db_inputs = session[:db_inputs]
		

		if is_good == 1
			teach(ann_inputs, db_to_ann(db_inputs))
			render :json => {st: 0}
		else
			# choose another food
			food_results = search_food(db_inputs, cur_rank+1)
			render :json => {
				st: 0, 
				food_rank: cur_rank+1, 
				food_name: food_results.name, 
				food_img: food_results.image
			}
		end
	end
	
	def answers_to_ann(answers)
		converted = []
		answers.each do |a|
			converted.push((a.to_f)/5)
		end
		converted
	end

	def ann_to_db(original)
		converted = []
		original.each do |a|
			converted.push((a*100).round)
		end
		converted
	end

	def db_to_ann(results)
		converted = []
		results.each do |a|
			converted.push((a.to_f)/100)
		end
		converted
	end

	private :answers_to_ann, :ann_to_results, :results_to_ann
end
