require_relative './ann_helper'
require 'net/http'
require 'addressable/uri'

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

		ann_inputs = answers_to_ann(user_answers)
		db_inputs = ann_to_db(run_ann(ann_inputs))
		
		food_results = search_food(db_inputs)

		items = []
		food_results.each do |food|
			url = Addressable::URI.parse('http://openapi.naver.com/search?key=60d05617c25e04228bc8220dea6b1b6f&query=낙성대' +
																	 food[:tag] + '&target=local&start=1&display=10')
			puts(url)
			req = Net::HTTP::Get.new(url.to_s)
			res = Net::HTTP.start(url.host, url.port) do |http|
			  http.request(req)
			end
			res.body.force_encoding('ISO-8859-1')
			hash = Hash.from_xml(res.body)
			if hash['error'] != nil
				puts(res.body.inspect)
			elsif hash['rss']['channel']['display'].to_i > 0
				items.push(hash['rss']['channel']['item'])
			end
		end

		render json: {
			:st => 0,
			:food_results => food_results,
			:restaurants => items 
		}
	end

	#def submit
	#	redirect_to :suggestions_get_suggestion
	#end

	def search_food(input_list)
		def abs(number)
			if(number > 0)
				number
			else
				-number
			end
		end

		def makeTuple(food)
			[
				food.spicy,
				food.sour,
				food.sweet,
				food.salty,
				food.bitter,
				food.hot,
				food.cold,
				food.calories,
				food.time,
				food.price
			]
		end

		i = 0
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

			@answer[i] = [difference_value,(i+1)] 
			i = i + 1
		end
		
		@answer = @answer.sort

		#rank = 1 -> most appropriate food
		puts @answer.inspect
		
		#first 3 foods in the rank
		ret = []
		10.times do |i|
			ans = Food.find(@answer[i][1])
			ret.push({name: ans.name, img: ans.image,
								 tag: ans.tag, data: makeTuple(ans)})
		end
		return ret
	end
	
	def feedback
		is_good = params[:is_good].to_i
		ann_inputs = answers_to_ann(params[:user_answers])
		food_data = params[:food_data]
		if is_good == 1
			teach(ann_inputs, db_to_ann(food_data))
			render :json => {st: 0}
		else
			render :json => {st: 0}
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
		conveted = []
		original.each do |a|
			conveted.push((a*500).round)
		end
		conveted
	end

	def db_to_ann(results)
		conveted = []
		results.each do |a|
			conveted.push((a.to_f)/500)
		end
		conveted
	end

	private :answers_to_ann, :ann_to_db, :db_to_ann
end
