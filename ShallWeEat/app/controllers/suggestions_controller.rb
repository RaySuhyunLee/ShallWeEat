class SuggestionsController < ApplicationController

	def index

	end

#	def show
		
#	end

	def get_questions
		name = session[:name]
		if name.nil?
			redirect_to :accounts_index
		else 
			#take each of the 4 answers
			#append the 4 answers in an array of answers

			#params[:radio_buttons]	
			#else	  
			#end

			status = 0
		end
	#render :json(array(q1, q2, q3, q4))
	#render :json => {:st => status}
	end




	def get_suggestion

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



end
