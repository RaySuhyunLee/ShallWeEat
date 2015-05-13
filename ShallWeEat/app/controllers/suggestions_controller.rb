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
			
			#if params[:q1]== 'no'	    
			#else
			#end

			status = 0
		end
	#render :json => {:st => status}
	end



	def get_suggestion

	end

#	def submit
#		redirect_to :suggestions_get_suggestion
#	end

	def search_food(input_list)
	{
		def abs(number)
			if(number > 0)
				number
			else
				-number
			end
		end




	}




end
