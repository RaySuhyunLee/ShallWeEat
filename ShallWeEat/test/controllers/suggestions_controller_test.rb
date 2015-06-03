require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase


  test "#search_food function" do
    sug_con = SuggestionsController.new()
		
		Food.create(name: "chicken_original", spicy: 20, sour: 5, sweet: 50, salty: 50, bitter: 5, hot: 70, cold: 30, calories: 247, time: 50, price: 50, image: "/assets/chicken_original.png") 
		
		Food.create(name: "ramen", spicy:70, sour:0, sweet:20, salty:30, bitter:0, hot:80, cold:20, calories:385, time:5, price:5, image: "/assets/ramen.png")
		
		Food.create(name: "steak", spicy:10, sour:5, sweet:60, salty:40, bitter:0, hot:40, cold:60, calories:252, time:80, price:85, image: "/assets/steak.png")

		answer_food_1 = sug_con.search_food([20,5,50,50,5,70,30,247,50,50])
		answer_food_2 = sug_con.search_food([70,0,20,30,0,80,20,385,5,5])
		answer_food_3 = sug_con.search_food([10,5,60,40,0,40,60,252,80,85])
		
		if(answer_food_1[0] == "chicken" && 
				answer_food_2[0] == "ramen" &&
					answer_food_3[0] == "steak")
			assert true
		else
			assert false
		end	
   end


   test "#get_questions" do
   		get :get_questions 
   		#['Are you starving to death?', 'Do you lack money?', 'How are you today?', 'Are you busy?']
   		questions.include?('Are you starving to death?')
   end



end
